# Development Logs for SquareUp game  
``` This is a devlog through the making of SquareUp game ```


---

## Day 1 (6.16.2025)

### Progress  
- Started creating project SquareUp
- Designed simple pixel art for the game
- Created character scene for the player character  
- Provided grid-based movement for player  
- Created tilemaps for stage level  
*Bug: Movement not optimized for tilemap*  
*Temporary Fix: Used raycast for checking collision. Boundaries are checked, tilemaps are not*  

## Day 2 (6.17.2025)

### Progress
- Improved ordering of TileMapLayers  
- Provided a script to identify if player is within the boundaries of the object cube  
  *Error: Ran into an infinite loop trying to figure out how to utilize while loop*  
  *Syntax of error:*  
  *While **node**:*  
  *Tip: Avoid using condition on while loop that will never result to a false return*   

