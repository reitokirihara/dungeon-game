VIRTUAL_WIDTH = 640
VIRTUAL_HEIGHT = 480

SCREEN_WIDTH = 1280
SCREEN_HEIGHT = 960

TILES_PER_ROW = 8
TILE_SIZE = 32

BOARD_X_OFFSET = (VIRTUAL_WIDTH - TILES_PER_ROW * TILE_SIZE)/2
BOARD_Y_OFFSET = (VIRTUAL_HEIGHT - TILES_PER_ROW * TILE_SIZE)/4

DIR_UP = 1
DIR_RIGHT = 2
DIR_DOWN = 3
DIR_LEFT = 4
VEC_UP = vector(0, -1)
VEC_RIGHT = vector(1, 0)
VEC_DOWN = vector(0, 1)
VEC_LEFT = vector(-1, 0)

DIRS = {}
DIRS[DIR_UP] = VEC_UP
DIRS[DIR_RIGHT] = VEC_RIGHT
DIRS[DIR_DOWN] = VEC_DOWN
DIRS[DIR_LEFT] = VEC_LEFT

COLOR_BLACK = {0,0,0}