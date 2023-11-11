# Godot Wild Jam 63

## Isometric Tilemap
We have cubes as tiles for the tilemap. You need to understand the "actual" dimension of the tile.
For us it was 32x16. Then you need to create a single tile or a tile atlas. 
Be carefull! it should be an EVEN by EVEN dimension, otherwise it's a mess.
We had a single cube and a column of cubes. The column was used for the walls.
You need to enable Y-Sort on the tilemap and on the distinct layers of the tilemap. Use Z-index to understand which layer will be rendered on top of which.
Now we met 2 problems:
- the tile size (for us was for example 32x38) in the case of the column is much smaller (the column is made of two sells).
- the romboid tile was not aligned with the bottom.

### Column Tiles Size
In order to do this, you need to select only one half of the column. If the column was made of multiple cells (4x4), just select one.Then, in the tileset view, in the "select" sub-menu change the size atlas. For us, since the column was vertical, the atlas size was 1x2.
Now you have a working and tilable column.

### Align the Romboid
In the same select menu, change the textur origin posizion. For us it was (0,31).
