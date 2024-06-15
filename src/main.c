#include "SDL2/SDL.h"
#include <stdio.h>

int main(int argc, const char *argv[]) {
    SDL_Window *window;
    SDL_Renderer *renderer;

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        fprintf(stderr, "SDL_Init(): %s\n", SDL_GetError());
        exit(1);
    }

    window = SDL_CreateWindow("Hello, SDL2!", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_OPENGL);

    return 0;
}
