# IdleLines

**IdleLines** is a lightweight World of Warcraft addon that displays atmospheric, poetic text inside a beautifully styled, book-like frame. Lines fade in one by one, creating a calm, immersive reading experience while you’re idle, traveling, waiting, or simply in the mood for something ambient and reflective.

What began as a small idle flavor addon has evolved into a **fully customizable poetic display system**, featuring deeply themed visual styles and **thousands of handcrafted, evocative lines** generated from layered templates.

IdleLines is built entirely with the Blizzard API — no external libraries, no custom assets — designed to feel native, quiet, and unobtrusive.

---

## ✨ Features

- 📜 **Line-by-line fade-in animation**  
  Text appears gradually for a gentle, readable flow.

- 📖 **Tome-style display frame**  
  Movable, resizable, and scalable — fits naturally into any UI layout.

- 🎨 **Advanced theme system**  
  Themes control backgrounds, borders, colors, outlines, tiling, and spacing.

- 🖋️ **Customizable fonts & typography**  
  Choose any WoW font object and adjust size and presentation.

- 🧠 **Massive poetic template library**  
  Thousands of lines generated from layered templates for variety and tone.

- 🪶 **One-click poem export**  
  Instantly copy the full poem via a built-in export window.

- 🌙 **Optional fade-out behavior**  
  Automatically fades the tome after a configurable delay.

- ⚙️ **Lightweight & Blizzard-native**  
  No dependencies, minimal overhead, pure WoW API.

---

## 📦 Installation

1. Download the addon folder.
2. Place it into:

```
World of Warcraft/retail/Interface/AddOns/
```

3. Restart WoW or reload your UI.

---

## 🔧 Slash Commands

```
/idle
```
Opens the IdleLines configuration panel.

```
/idle test
```
Generates and displays a test poem immediately.

```
/idle hide
```
Hides the current poem frame.

```
/idle reset
```
Resets all IdleLines settings to their defaults.

---

## 🎨 Themes Included

IdleLines ships with multiple handcrafted themes, selectable from the configuration UI:

- **Dark**  
  Minimal dark styling with soft gray trim.

- **DeathKnight**  
  Frost-tinted stone and icy blues inspired by Death Knight artifacts.

- **DemonHunter**  
  Fel-touched greens and purples with high-contrast accents.

- **Druid**  
  Natural tones inspired by bark, leaves, and ancient druidic relics.

- **Hunter**  
  Earthy greens and muted golds with a rugged, outdoors feel.

- **Mage**  
  Cool arcane blues with a clean, crystalline presentation.

- **Monk**  
  Jade and gold tones inspired by Pandarian aesthetics.

- **Paladin**  
  Holy gold and soft rose accents with a radiant feel.

- **Priest**  
  Clean whites and light neutrals for a calm, reverent presentation.

- **ShadowPriest**  
  Void-touched purples with darker, ominous accents.

- **Rogue**  
  Deep crimson tones with sharp contrast and subtle menace.

- **Shaman**  
  Elemental blues inspired by water, wind, and storm.

- **Warlock**  
  Fel and void purples with arcane contrast.

- **Warrior**  
  Warm bronze and iron tones inspired by weapons and armor.

Each theme defines:
- background atlas or texture  
- border style and edge sizing  
- text color  
- title color  
- outline color  
- tiling and padding behavior  

Themes are tuned for readability across both bright and dark backgrounds and are designed to be easily extended.

---

### 🧾 How Poems Are Generated

IdleLines does not display static quotes and does not collect or transmit any personal or identifying data.

Poems are **procedurally assembled** from a large library of handcrafted templates and fragments, generated locally at runtime to create varied, atmospheric text.

#### What data is used

IdleLines uses a limited set of **non-identifying, in-game context signals** provided by the World of Warcraft API, including:

- the player’s **class** (for thematic tone)
- the player’s **faction** (Alliance / Horde, where applicable)
- the player’s **current zone or area** (to select environment-appropriate templates)
- **time of day** (day / night context for mood and atmosphere)
- **recent loot events** (used only for light flavor text, not item evaluation)
- whether the player is **idle or inactive**
- the addon’s own configuration settings (theme, font, scale, timing)

This information is used solely to:
- select relevant poetic templates
- subtly adjust tone, mood, and atmosphere
- provide light environmental or situational flavor
- determine when poems should appear

#### What data is *not* used

IdleLines **does not**:

- read or analyze chat messages
- access or display player names, realms, or guilds
- inspect item stats, values, or equipment
- track quests, achievements, or combat performance
- store behavioral history or long-term activity
- transmit data outside the game
- use analytics, telemetry, or external services

#### Saved data

IdleLines **does not store any generated text or gameplay context**.

The only data saved to disk are **user configuration settings** (such as theme selection, font choice, scale, and timing), stored via standard WoW SavedVariables.

No poems, events, zones, loot, or player behavior data are written to SavedVariables.

All poem generation occurs **entirely in memory** and is discarded once displayed.

#### How generation works

The poem system works by:
- selecting an overall structure (opening, body, closing)
- choosing template fragments based on available context (such as zone, time of day, or recent events)
- layering multiple fragments together
- varying phrasing, cadence, and rhythm
- avoiding immediate repetition
- maintaining a consistent, ambient tone

The result is poetry that feels:
- responsive without being intrusive  
- ambient rather than distracting  
- reflective instead of mechanical  

With thousands of possible combinations, poems remain fresh even across long play sessions.


---

## 📤 Exporting Poems

Click **Copy Poem** at the bottom of the tome window to open the export popup.

The export window includes:
- the full generated poem  
- the current title  
- automatic text highlighting  
- easy copy & paste for sharing or saving  

---

## 📝 License

MIT License.  
Feel free to fork, modify, or build on top of IdleLines.

---

## ❤️ Credits

Created by **Gravebear**

- GitHub: https://github.com/GraveofBears  
- Support the project: https://buymeacoffee.com/gravebear
