This project is a turn-based deck-builder roguelike card game built with Swift and UIKit.
The player selects a starting deck, fights scaling enemies, acquires skills, manages resources, and makes risk–reward decisions through events.
The game focuses on:
Strategic deck management
Synergy-based builds
Progressive difficulty scaling
🎮 Gameplay Overview
Choose 1 of 4 starting decks.
Each turn, you have 3 cards in hand.
Spend mana to play cards.
Cards apply effects (damage, curse, lifesteal, shield, etc.).
Enemy attacks after your turn.
Every 3 enemies defeated, a random screen appears:
Skills
Shop
Delete Cards
Event
Difficulty increases as turns progress.
🧙 Deck Types
1. Wizard (Type 1)
Spell-focused, combo and burst damage.
2. Dark Lord (Type 2)
Hybrid damage + healing synergy.
3. Giants (Type 3)
Shield and defensive playstyle.
4. Alchemist (Type 4)
Curse-based scaling mechanics.
🃏 Card System
Each card contains:
name
power
cost
image
description
logo
price
type
special
Special Types
ID	Special	Description
0	Damage	Standard damage
1	Shield	Generates shield
2	Curse	Increases curse
3	Lifesteal	Deals damage and heals
☠ Curse Mechanic
Curse is a scaling damage mechanic.
When a card is played:
EnemyHealth -= curse * 10
curse -= 2
When an enemy dies:
curse = curse / 3
Curse is high-risk, high-reward:
Scales extremely well
Decays over time
Strong synergy with specific skills
🛡 Skill System
Skills are permanent passive upgrades.
Examples:
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
Skills scale with level and enhance build specialization.
🏪 Shop System
Buy new cards
Spend gold
Increase totalbuyedcards counter
Expand deck for synergy builds
❌ Delete System
Shows 4 random cards from:
Hand
Deck
Discard pile
Cards are removed from their original source
Selling returns half the card price
Enables deck thinning strategy
🎲 Event System
Random events offer good or bad choices.
Example Good Options
+100 Health
+100 Gold
+3 Curse
Random card
Buff a random card
Example Bad Options
−40 Health
−100 Gold
Enemies gain power
Discard random card
Increased enemy damage next turn
Events introduce strategic risk–reward decisions.
📈 Difficulty Scaling
Every 3 enemies → turn increases
ampcounter increases enemy stats
Every 10 turns → global stat scaling
After extended progression → large difficulty spike
Enemies gain:
Damage
Max health
Health scaling
💰 Resources
Mana
Health
Shield
Gold
Curse
🧠 Strategic Depth
The game supports multiple build paths:
Curse stacking build
Lifesteal sustain build
Shield tank build
Spell combo burst build
Deck-thinning optimization
Card buff builds
🏗 Technical Structure
UIKit-based architecture
MVC structure
UINavigationController flow
UITableView (Keywords screen)
Gesture Recognizers (tap & long press)
Custom UIImage-based icon system
Segue-based navigation
Global gameplay state via static variables
📂 Main Screens
Deck Selection
Gameplay
Skills
Shop
Delete Cards
Event (Options)
Keywords
Enlarged Card View
🎨 UI Style
Gold-framed circular icon badges
Slight 3D-styled emblem icons
Custom special icons (Curse, Shield, Lifesteal)
Long-press card enlargement view
🔮 Future Improvements
Save system
Persistent runs
Boss fights
Relic system
More event variety
Animation polish
Sound effects
Balance tuning (Curse scaling, difficulty curve)
👨‍💻 Development Notes
This project was built to practice:
Game logic architecture
State management
Scaling systems
Risk–reward design
UIKit navigation & UI handling
Custom game mechanics implementation
It demonstrates the foundation of a roguelike deck-builder built entirely with Swift and UIKit.
