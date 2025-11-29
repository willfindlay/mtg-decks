# Generate Deck Information

Generate or update a deck-level CLAUDE.md file with detailed card information from Scryfall.

## Arguments

- `$ARGUMENTS` - The deck directory name (e.g., `aragorn`)

## Instructions

1. **Validate the deck directory exists** at `./$ARGUMENTS/`. If it doesn't exist, inform the user and stop.

2. **Read all card files** in the deck directory:
   - `commander.txt`
   - `main-deck.txt`
   - `sideboard.txt`
   - `considering.txt`

   Extract all card names from these files.

3. **Check if `./$ARGUMENTS/CLAUDE.md` exists**:
   - If it exists, read it and extract the list of cards already documented in the Card Reference section
   - Determine which cards from step 2 are NOT already documented
   - If it doesn't exist, all cards need to be looked up

4. **For each card NOT already documented**, use the Scryfall MCP tools to look up:
   - Card name
   - Mana cost (with pips)
   - Type line
   - Oracle text
   - Power/toughness (if creature)
   - Colors and color identity

5. **Write or update the deck-level CLAUDE.md** following the format specified in the project-level CLAUDE.md under "Deck-Level CLAUDE.md Format":
   - If updating, preserve existing card entries and any custom notes
   - Add new card entries for cards that weren't previously documented
   - Remove entries for cards no longer in the deck

6. **Group cards by category** based on their type:
   - Commander
   - Creatures (non-commander)
   - Instants
   - Sorceries
   - Enchantments
   - Artifacts
   - Lands
   - Sideboard
   - Considering

7. **Include interaction notes** for cards that have notable synergies with other cards in the deck, especially with the commander.

8. After completion, inform the user:
   - How many cards were already documented (skipped)
   - How many new cards were looked up
   - How many cards were removed (no longer in deck)
   - Where the file was written
