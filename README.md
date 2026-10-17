# Mekanism: Coal Recipes

A small unofficial Mekanism addon that turns bio fuel into coal through a new processing chain.

| Requirement | Version |
| --- | --- |
| Minecraft | **1.21.1** |
| Mod loader | **NeoForge 21.1.251** |
| Mekanism | **10.7.x** — tested with **10.7.19.85** |
| Java | **21** |

## Installation

Download the JAR from [Releases](https://github.com/Nosopirkafx/mekanism-coal-recipes/releases) and place it in your `mods` folder alongside Mekanism. For multiplayer, install the addon on both the server and all clients.

## Recipes

| Machine | Input | Output |
| --- | --- | --- |
| Pressurized Reaction Chamber | 2 Bio Fuel + 500 mB Water + 200 mB Oxygen | **1 Coal Clump + 100 mB Hydrogen** |
| Combiner | 3 Coal Clumps + 1 Stone | **1 Coal Ore** |

The reaction takes **30 seconds (600 ticks)** without speed upgrades.

Mekanism's existing Enrichment Chamber recipe then turns the ore into **2 Coal**. Recipes appear in JEI. English and Russian translations are included.

> For automation, configure the chamber's connected side as an **item input** for the Logistical Transporter. Fluid and chemical inputs have separate configuration tabs.

## Development

Java 21 and an internet connection are required. Build on Windows:

```powershell
./gradlew.bat build
```

On Linux/macOS, use `./gradlew build`. The JAR is written to `build/libs/`.

- Recipes: `src/main/resources/data/mek_coal_synthesis/recipe/`.
- Texture, model, and translations: `src/main/resources/assets/mek_coal_synthesis/`.
- Item registration: `src/main/java/dev/coalsynthesis/CoalSynthesis.java`.

To launch a development client, place the Mekanism 1.21.1 JAR in `libs/` and run `./gradlew.bat runClient`. The internal mod ID remains `mek_coal_synthesis` for compatibility with existing worlds.

License: [MIT](LICENSE). This project is not affiliated with the Mekanism team. The texture was created using ImageGen and prepared as a 32×32 game asset.
