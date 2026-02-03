/**
 * Example: Check ticket prices for routes
 * Using Deutsche Bahn API for pricing information
 */

import { createClient } from 'db-vendo-client';
import { profile as dbnavProfile } from 'db-vendo-client/p/dbnav/index.js';

async function checkPrice(fromId, fromName, toId, toName) {
  const client = createClient(dbnavProfile, 'clawdbot-bahn-skill');

  console.log(`\n💰 Checking prices: ${fromName} → ${toName}`);
  console.log(`Time: ${new Date().toLocaleString('de-DE')}\n`);

  const { journeys } = await client.journeys(fromId, toId, {
    departure: new Date(),
    results: 5
  });

  if (journeys.length === 0) {
    console.log('No connections found.');
    return;
  }

  console.log(`Found ${journeys.length} connections:\n`);

  journeys.forEach((journey, i) => {
    const price = journey.price;

    console.log(`${i + 1}. ${fromName} → ${toName}`);

    if (price && price.amount) {
      console.log(`   💵 Price: ${price.amount} ${price.currency}`);
      if (price.hint) {
        console.log(`   ℹ️  ${price.hint}`);
      }
      if (price.partialFare) {
        console.log(`   ⚠️  Partial fare (may require additional tickets)`);
      }
    } else {
      console.log(`   💵 Price: Not available`);
    }

    // Show departure time and duration
    const firstLeg = journey.legs[0];
    const lastLeg = journey.legs[journey.legs.length - 1];

    if (firstLeg.departure) {
      console.log(`   🕐 Departure: ${firstLeg.departure.toLocaleString('de-DE', { hour: '2-digit', minute: '2-digit' })}`);
    }

    if (journey.duration) {
      const durationMin = Math.round(journey.duration / 60000);
      console.log(`   ⏱️  Duration: ${durationMin} minutes`);
    }

    // Show changes
    const changes = journey.legs.length - 1;
    console.log(`   🔄 Changes: ${changes}`);

    console.log();
  });
}

async function main() {
  // Example: Check prices for major routes
  await checkPrice('8098160', 'Berlin Hbf', '8000261', 'München Hbf');
  await checkPrice('8000105', 'Frankfurt (Main) Hbf', '8000261', 'München Hbf');
}

main().catch(console.error);
