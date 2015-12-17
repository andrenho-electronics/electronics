#include <stdbool.h>
#include <string.h>
#include <stdio.h>

#define NUM_LINES 4 /* 60 */

struct Display {
    int backscroll;
    char lines[NUM_LINES][16];
    char display[2][16];
    int cursor_x, cursor_y;
    bool dirty;
} display = {
    .backscroll = 0,
    .lines = {{ 0 }},
    .display = {{ 0 }},
    .cursor_x = 0,
    .cursor_y = NUM_LINES-2,
    .dirty = true,
};


static void display_add_char(char c)
{
    display.dirty = true;
    display.backscroll = 0;

    // add char
    if(c == 13) {
        display.cursor_x = 0;
        ++display.cursor_y;
    } else {
        display.lines[display.cursor_y][display.cursor_x] = c;

        ++display.cursor_x;
        if(display.cursor_x >= 16) {
            display.cursor_x = 0;
            ++display.cursor_y;
        }
    }

    if(display.cursor_y >= NUM_LINES) {
        display.cursor_y = NUM_LINES - 1;
        for(int y=1; y<NUM_LINES; ++y) {
            memcpy(&display.lines[y-1], &display.lines[y], 16);
        }
        memset(&display.lines[NUM_LINES-1], ' ', 16);
    }
}


static void display_clear()
{
    display.backscroll = 0;
    display.cursor_x = 0;
    for(int y=0; y<NUM_LINES; ++y) {
        memset(&display.lines[y], ' ', 16);
    }
    for(int y=0; y<2; ++y) {
        memset(&display.display[y], ' ', 16);
    }
    display.cursor_y = NUM_LINES-2;
    display.dirty = true;
}


static void display_scroll(int n)
{
    display.backscroll -= n;
    if(display.backscroll < 0) {
        display.backscroll = 0;
    } else if(display.backscroll >= NUM_LINES - 2) {
        display.backscroll = NUM_LINES - 2;
    }
    display.dirty = true;
}


static void display_update()
{
    if(!display.dirty) {
        return;
    }

    int by = NUM_LINES - display.backscroll - 2;
    for(int y=0; y<2; ++y) {
        for(int x=0; x<16; ++x) {
            if(display.display[y][x] != display.lines[y+by][x]) {
                display.display[y][x] = display.lines[y+by][x];
                // TODO - send to display
            }
        }
    }
    // TODO - send cursor position to display (or disable when backscroll is != 0)
}


static void print()
{
    display_update();

    printf("..\n");
    for(int y=0; y<NUM_LINES; ++y) {
        if((y == NUM_LINES - display.backscroll - 2) || (y == NUM_LINES - display.backscroll)) {
            printf("----------------\n");
        }
        for(int x=0; x<16; ++x) {
            char c = display.lines[y][x];
            printf("%c", c ? c : ' ');
        }
        printf("\n");
    }
    if(display.backscroll == 0) {
        printf("----------------\n");
    }
    printf("..\n");
    printf("\n");
    printf("Display:\n");
    for(int y=0; y<2; ++y) {
        for(int x=0; x<16; ++x) {
            char c = display.display[y][x];
            if(x == display.cursor_x && (NUM_LINES - 2 + y) == display.cursor_y && display.backscroll == 0) {
                printf("*");
            } else {
                printf("%c", c ? c : ' ');
            }
        }
        printf("\n");
    }
}


int main()
{
    display_add_char('1');
    display_add_char('e');
    display_add_char('l');
    display_add_char('l');
    display_add_char('o');
    display_add_char('!');
    display_add_char(13);
    display_add_char(' ');
    display_add_char('2');
    display_add_char('e');
    display_add_char('l');
    display_add_char('l');
    display_add_char('o');
    display_add_char('!');
    display_add_char(13);
    display_add_char(' ');
    display_add_char(' ');
    display_add_char('3');
    display_add_char('e');
    display_add_char('l');
    display_add_char('l');
    display_add_char('o');
    display_add_char('!');

    display_scroll(-1);
    display_scroll(-1);

    display_add_char('&');
    display_clear();

    print();
}


// vim: ts=4:sw=4:sts=4:expandtab
