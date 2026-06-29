#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Console
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_TEXTMODE_BUFFER := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_SELECTION_INVERTED := 16

/**
 * @type {Integer (UInt32)}
 */
export global VDM_HIDE_WINDOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global VDM_IS_ICONIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global VDM_CLIENT_RECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global VDM_CLIENT_TO_SCREEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global VDM_SCREEN_TO_CLIENT := 5

/**
 * @type {Integer (UInt32)}
 */
export global VDM_IS_HIDDEN := 6

/**
 * @type {Integer (UInt32)}
 */
export global VDM_FULLSCREEN_NOPAINT := 7

/**
 * @type {Integer (UInt32)}
 */
export global VDM_SET_VIDEO_MODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_UNREGISTER_VDM := 0

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_REGISTER_VDM := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_REGISTER_WOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_NOSHORTCUTKEY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_ALTTAB := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_ALTESC := 2

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_ALTSPACE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_ALTENTER := 8

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_ALTPRTSC := 16

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_PRTSC := 32

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_CTRLESC := 64

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_MODIFIER_SHIFT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_MODIFIER_CONTROL := 4

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_MODIFIER_ALT := 8

/**
 * @type {Integer (UInt32)}
 */
export global CHAR_TYPE_SBCS := 0

/**
 * @type {Integer (UInt32)}
 */
export global CHAR_TYPE_LEADING := 2

/**
 * @type {Integer (UInt32)}
 */
export global CHAR_TYPE_TRAILING := 3

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_HANDLE_SIGNATURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_HANDLE_NEVERSET := 268435456

/**
 * @type {String}
 */
export global CONSOLE_INPUT_STRING := "CONIN$"

/**
 * @type {String}
 */
export global CONSOLE_OUTPUT_STRING := "CONOUT$"

/**
 * @type {String}
 */
export global CONSOLE_GENERIC := "CON"

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_FORCEV2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_WRAPTEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_FILTERONPASTE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_CTRLKEYSDISABLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_LINESELECTION := 5

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_WINDOWTRANSPARENCY := 6

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_WINDOWMAXIMIZED := 7

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_CURSOR_TYPE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_CURSOR_COLOR := 9

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_INTERCEPT_COPY_PASTE := 10

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_DEFAULTFOREGROUND := 11

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_DEFAULTBACKGROUND := 12

/**
 * @type {Integer (UInt32)}
 */
export global PID_CONSOLE_TERMINALSCROLLING := 13

/**
 * @type {Integer (UInt32)}
 */
export global ATTACH_PARENT_PROCESS := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CTRL_C_EVENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CTRL_BREAK_EVENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTRL_CLOSE_EVENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CTRL_LOGOFF_EVENT := 5

/**
 * @type {Integer (UInt32)}
 */
export global CTRL_SHUTDOWN_EVENT := 6

/**
 * @type {Integer (UInt32)}
 */
export global PSEUDOCONSOLE_INHERIT_CURSOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_NO_SELECTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_SELECTION_IN_PROGRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_SELECTION_NOT_EMPTY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_MOUSE_SELECTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_MOUSE_DOWN := 8

/**
 * @type {Integer (UInt32)}
 */
export global HISTORY_NO_DUP_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_FULLSCREEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_FULLSCREEN_HARDWARE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_FULLSCREEN_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONSOLE_WINDOWED_MODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RIGHT_ALT_PRESSED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LEFT_ALT_PRESSED := 2

/**
 * @type {Integer (UInt32)}
 */
export global RIGHT_CTRL_PRESSED := 4

/**
 * @type {Integer (UInt32)}
 */
export global LEFT_CTRL_PRESSED := 8

/**
 * @type {Integer (UInt32)}
 */
export global SHIFT_PRESSED := 16

/**
 * @type {Integer (UInt32)}
 */
export global NUMLOCK_ON := 32

/**
 * @type {Integer (UInt32)}
 */
export global SCROLLLOCK_ON := 64

/**
 * @type {Integer (UInt32)}
 */
export global CAPSLOCK_ON := 128

/**
 * @type {Integer (UInt32)}
 */
export global ENHANCED_KEY := 256

/**
 * @type {Integer (UInt32)}
 */
export global NLS_DBCSCHAR := 65536

/**
 * @type {Integer (UInt32)}
 */
export global NLS_ALPHANUMERIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global NLS_KATAKANA := 131072

/**
 * @type {Integer (UInt32)}
 */
export global NLS_HIRAGANA := 262144

/**
 * @type {Integer (UInt32)}
 */
export global NLS_ROMAN := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global NLS_IME_CONVERSION := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global ALTNUMPAD_BIT := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global NLS_IME_DISABLE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global FROM_LEFT_1ST_BUTTON_PRESSED := 1

/**
 * @type {Integer (UInt32)}
 */
export global RIGHTMOST_BUTTON_PRESSED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FROM_LEFT_2ND_BUTTON_PRESSED := 4

/**
 * @type {Integer (UInt32)}
 */
export global FROM_LEFT_3RD_BUTTON_PRESSED := 8

/**
 * @type {Integer (UInt32)}
 */
export global FROM_LEFT_4TH_BUTTON_PRESSED := 16

/**
 * @type {Integer (UInt32)}
 */
export global MOUSE_MOVED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOUBLE_CLICK := 2

/**
 * @type {Integer (UInt32)}
 */
export global MOUSE_WHEELED := 4

/**
 * @type {Integer (UInt32)}
 */
export global MOUSE_HWHEELED := 8

/**
 * @type {Integer (UInt32)}
 */
export global KEY_EVENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MOUSE_EVENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINDOW_BUFFER_SIZE_EVENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global MENU_EVENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global FOCUS_EVENT := 16
;@endregion Constants
