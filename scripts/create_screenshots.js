/*
 * Copyright (c) 2025 Andrés Villarreal
 * Licensed under MIT License - see LICENSE file for details
 */

import { chromium } from "playwright";
import { existsSync, mkdirSync } from "fs";

const url = process.argv[2];
const outputDir = process.argv[3];
const viewportWidth = 1024;
const viewportHeight = 768;
const count = 16 * 3;
const delay = 62.5;

// Create screenshots directory if it doesn"t exist
if (!existsSync(outputDir)) {
  mkdirSync(outputDir);
}

const browser = await chromium.launch();
const context = await browser.newContext({
  viewport: { width: viewportWidth, height: viewportHeight }
});
const page = await context.newPage();

await page.goto(url);

for (let i = 1; i <= count; i++) {
  await page.screenshot({ path: `${outputDir}/screenshot-${i}.png` });
  await page.waitForTimeout(delay);
}

await browser.close();