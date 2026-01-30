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

## 🧾 How Poems Are Generated

IdleLines does not display static quotes.

Instead, poems are **procedurally assembled** from a large library of handcrafted templates and fragments.

The generation system works by:
- selecting an overall structure (opening, body, closing)
- layering multiple template fragments together
- varying phrasing, cadence, and rhythm
- avoiding immediate repetition
- preserving a consistent, atmospheric tone

The result is poetry that feels:
- ambient rather than distracting  
- reflective rather than random  
- organic instead of mechanical  

With thousands of possible combinations, poems remain fresh even over long play sessions.

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
