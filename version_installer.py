import curses
import subprocess

def character(stdscr, options):
    print(options)
    attributes = {}
    curses.init_pair(1, curses.COLOR_WHITE, curses.COLOR_BLACK)
    attributes['normal'] = curses.color_pair(1)

    curses.init_pair(2, curses.COLOR_BLACK, curses.COLOR_WHITE)
    attributes['highlighted'] = curses.color_pair(2)

    c = 0  # last character read
    option = 0  # the current option that is marked
    while c != 10:  # Enter in ascii
        stdscr.erase()
        stdscr.addstr("Choose version\n\n", curses.A_UNDERLINE)
        for i in range(len(options)):
            if i == option:
                attr = attributes['highlighted']
            else:
                attr = attributes['normal']
            stdscr.addstr("{0}. ".format(i + 1))
            stdscr.addstr(options[i] + '\n', attr)
        c = stdscr.getch()
        if c == curses.KEY_UP and option > 0:
            option -= 1
        elif c == curses.KEY_DOWN and option < len(options) - 1:
            option += 1

    return options[option]

try:
    import sys
    if sys.argv[1] == 'install':
        versions = subprocess.check_output("brew search --formulae '/php@/'", shell=True)
        options = [x for x in versions.decode('utf-8').split("\n") if '-' not in x and x != '']
        choice = curses.wrapper(character, options)
        print("Installing {0}".format(choice))
        subprocess.call("brew install {0} && zsh".format(choice), shell=True)
    elif sys.argv[1] == 'remove':
        versions = subprocess.check_output("brew list", shell=True)
        options = [x for x in versions.decode('utf-8').split("\n") if 'php' in x and x != '']
        choice = curses.wrapper(character, options)
        print("Uninstalling {0}".format(choice))
        subprocess.call("brew uninstall {0} && zsh".format(choice), shell=True)
except:
    exit