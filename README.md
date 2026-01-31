
Turn-Based Roguelike Card Game
A Swift / UIKit Deck-Builder Experience
🎮 Overview
This project is a turn-based roguelike deck-building card game built entirely with Swift and UIKit.
Players choose a starting deck, fight progressively stronger enemies, gain skills, manage resources, and make high-risk decisions through random events.
The game emphasizes:
🧠 Strategic deck management
🔥 Synergy-based builds
⚖️ Risk vs Reward mechanics 
📈 Progressive difficulty scaling
🧙 Starting Decks
Choose one of four archetypes:
🔮 Wizard (Type 1)
High spell damage and combo potential.
🌑 Dark Lord (Type 2)
Hybrid damage + healing synergy.
🗿 Giants (Type 3)
Defensive, shield-oriented gameplay.
🧪 Alchemist (Type 4)
Curse-based scaling and advanced mechanics.
🃏 Card System
Each card includes:
name
power
cost
image
description
logo
price
type
special
✨ Special Keywords
ID	Keyword	Effect
0	Damage	Standard damage
1	Shield	Grants shield
2	Curse	Increases curse counter
3	Lifesteal	Deals damage and heals
☠ Curse Mechanic (Core Feature)
Curse is a stacking damage system:
After each card:
EnemyHealth -= curse * 10
curse -= 2
After killing an enemy:
curse = curse / 3
Curse creates a powerful scaling loop:
🚀 High burst potential
⏳ Natural decay
💥 Skill synergy interactions
🛡 Skill System
Skills provide permanent passive upgrades and scale with level.
Examples include:
Spell Damage
Heal Magic
Hearth of Mana
Little Help
Giant Slayer
Shadow Rises
Spell Combo
Tougher Than Ever
Shield Magic
Attacking Safe
Excellent Deal
More Misery
Healing Curse
Skills encourage specialized builds and replayability.
🏪 Shop System
Buy new cards
Expand deck size
Increase synergy options
Track added cards via totalbuyedcards
Deck expansion directly influences certain skill effects.
❌ Delete System (Deck Thinning)
Shows 4 random cards from:
Hand
Deck
Discard pile
Selling returns half price
Enables optimized deck builds
🎲 Event System
Random events introduce decision-based gameplay.
🟢 Good Options
Gain Health
Gain Gold
Add Curse
Gain Random Card
Buff a Random Card
🔴 Bad Options
Lose Health
Lose Gold
Increase Enemy Power
Discard Random Card
Enemy Buff Next Turn
Each event forces strategic trade-offs.
📈 Difficulty Scaling
The game scales dynamically:
Every 3 enemies → Turn increases
ampcounter increases enemy stats
Every 10 turns → Additional scaling
Extended runs → Major difficulty spikes
Enemies scale in:
Damage
Max Health
Health
💰 Core Resources
Mana
Health
Shield
Gold
Curse
🧠 Build Possibilities
Players can create multiple viable strategies:
☠ Curse stacking builds
❤️ Lifesteal sustain builds
🛡 Shield tank builds
🔮 Spell combo burst builds
✂ Deck thinning optimization builds
📈 Card buff builds
🏗 Technical Architecture
UIKit-based navigation
MVC pattern
UINavigationController flow
UITableView (Keywords system)
Gesture recognizers (Tap + Long Press)
Custom special icon system
Segue-driven screen transitions
Static gameplay state management
📂 Main Screens
Deck Selection
Gameplay
Skills
Shop
Delete Cards
Events
Keywords
Enlarged Card View
🎨 UI Style
Gold circular emblem design
Slight 3D-styled icons
Custom special symbols
Long-press enlargement previews
🔮 Planned Improvements
Save system
Boss encounters
Relic system
Expanded event pool
Animation polish
Sound design
Balance adjustments
👨‍💻 Development Focus
This project demonstrates:
Game state management
Scaling system design
Risk–reward balancing
Roguelike progression structure
UIKit-based game UI architecture
It serves as a foundation for a scalable roguelike deck-builder entirely developed in Swift.
