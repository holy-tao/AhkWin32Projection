#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global EXTENDED_BIT := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global DONTCARE_BIT := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FAKE_KEYSTROKE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global KBDBASE := 0

/**
 * @type {Integer (UInt32)}
 */
export global KBDSHIFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global KBDCTRL := 2

/**
 * @type {Integer (UInt32)}
 */
export global KBDALT := 4

/**
 * @type {Integer (UInt32)}
 */
export global KBDKANA := 8

/**
 * @type {Integer (UInt32)}
 */
export global KBDROYA := 16

/**
 * @type {Integer (UInt32)}
 */
export global KBDLOYA := 32

/**
 * @type {Integer (UInt32)}
 */
export global KBDGRPSELTAP := 128

/**
 * @type {Integer (UInt32)}
 */
export global GRAVE := 768

/**
 * @type {Integer (UInt32)}
 */
export global ACUTE := 769

/**
 * @type {Integer (UInt32)}
 */
export global CIRCUMFLEX := 770

/**
 * @type {Integer (UInt32)}
 */
export global TILDE := 771

/**
 * @type {Integer (UInt32)}
 */
export global MACRON := 772

/**
 * @type {Integer (UInt32)}
 */
export global OVERSCORE := 773

/**
 * @type {Integer (UInt32)}
 */
export global BREVE := 774

/**
 * @type {Integer (UInt32)}
 */
export global DOT_ABOVE := 775

/**
 * @type {Integer (UInt32)}
 */
export global UMLAUT := 776

/**
 * @type {Integer (UInt32)}
 */
export global DIARESIS := 776

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_ABOVE := 777

/**
 * @type {Integer (UInt32)}
 */
export global RING := 778

/**
 * @type {Integer (UInt32)}
 */
export global DOUBLE_ACUTE := 779

/**
 * @type {Integer (UInt32)}
 */
export global HACEK := 780

/**
 * @type {Integer (UInt32)}
 */
export global CEDILLA := 807

/**
 * @type {Integer (UInt32)}
 */
export global OGONEK := 808

/**
 * @type {Integer (UInt32)}
 */
export global TONOS := 900

/**
 * @type {Integer (UInt32)}
 */
export global DIARESIS_TONOS := 901

/**
 * @type {String}
 */
export global wszGRAVE := "̀"

/**
 * @type {String}
 */
export global wszACUTE := "́"

/**
 * @type {String}
 */
export global wszCIRCUMFLEX := "̂"

/**
 * @type {String}
 */
export global wszTILDE := "̃"

/**
 * @type {String}
 */
export global wszMACRON := "̄"

/**
 * @type {String}
 */
export global wszOVERSCORE := "̅"

/**
 * @type {String}
 */
export global wszBREVE := "̆"

/**
 * @type {String}
 */
export global wszDOT_ABOVE := "̇"

/**
 * @type {String}
 */
export global wszUMLAUT := "̈"

/**
 * @type {String}
 */
export global wszHOOK_ABOVE := "̉"

/**
 * @type {String}
 */
export global wszRING := "̊"

/**
 * @type {String}
 */
export global wszDOUBLE_ACUTE := "̋"

/**
 * @type {String}
 */
export global wszHACEK := "̌"

/**
 * @type {String}
 */
export global wszCEDILLA := "̧"

/**
 * @type {String}
 */
export global wszOGONEK := "̨"

/**
 * @type {String}
 */
export global wszTONOS := "΄"

/**
 * @type {String}
 */
export global wszDIARESIS_TONOS := "΅"

/**
 * @type {Integer (UInt32)}
 */
export global SHFT_INVALID := 15

/**
 * @type {Integer (UInt32)}
 */
export global WCH_NONE := 61440

/**
 * @type {Integer (UInt32)}
 */
export global WCH_DEAD := 61441

/**
 * @type {Integer (UInt32)}
 */
export global WCH_LGTR := 61442

/**
 * @type {Integer (UInt32)}
 */
export global CAPLOK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SGCAPS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CAPLOKALTGR := 4

/**
 * @type {Integer (UInt32)}
 */
export global KANALOK := 8

/**
 * @type {Integer (UInt32)}
 */
export global GRPSELTAP := 128

/**
 * @type {Integer (UInt32)}
 */
export global DKF_DEAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global KBD_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global KLLF_ALTGR := 1

/**
 * @type {Integer (UInt32)}
 */
export global KLLF_SHIFTLOCK := 2

/**
 * @type {Integer (UInt32)}
 */
export global KLLF_LRM_RLM := 4

/**
 * @type {Integer (UInt32)}
 */
export global KLLF_GLOBAL_ATTRS := 2

/**
 * @type {Integer (UInt32)}
 */
export global KBDTABLE_MULTI_MAX := 8

/**
 * @type {Integer (UInt32)}
 */
export global KEYBOARD_TYPE_GENERIC_101 := 4

/**
 * @type {Integer (UInt32)}
 */
export global KEYBOARD_TYPE_JAPAN := 7

/**
 * @type {Integer (UInt32)}
 */
export global KEYBOARD_TYPE_KOREA := 8

/**
 * @type {Integer (UInt32)}
 */
export global KEYBOARD_TYPE_UNKNOWN := 81

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_OEM_MICROSOFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_OEM_AX := 1

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_OEM_EPSON := 4

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_OEM_FUJITSU := 5

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_OEM_IBM := 7

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_OEM_MATSUSHITA := 10

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_OEM_NEC := 13

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_OEM_TOSHIBA := 18

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_OEM_DEC := 24

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_101_TYPE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_AX_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_106_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_002_TYPE := 3

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_001_TYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_FUNC := 12

/**
 * @type {Integer (UInt32)}
 */
export global AX_KBD_DESKTOP_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FMR_KBD_JIS_TYPE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FMR_KBD_OASYS_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FMV_KBD_OASYS_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global NEC_KBD_NORMAL_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global NEC_KBD_N_MODE_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global NEC_KBD_H_MODE_TYPE := 3

/**
 * @type {Integer (UInt32)}
 */
export global NEC_KBD_LAPTOP_TYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global NEC_KBD_106_TYPE := 5

/**
 * @type {Integer (UInt32)}
 */
export global TOSHIBA_KBD_DESKTOP_TYPE := 13

/**
 * @type {Integer (UInt32)}
 */
export global TOSHIBA_KBD_LAPTOP_TYPE := 15

/**
 * @type {Integer (UInt32)}
 */
export global DEC_KBD_ANSI_LAYOUT_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEC_KBD_JIS_LAYOUT_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_101A_TYPE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_101B_TYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_101C_TYPE := 5

/**
 * @type {Integer (UInt32)}
 */
export global MICROSOFT_KBD_103_TYPE := 6

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_INFO_SEND_IME_NOTIFICATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_INFO_ACCESSIBILITY_KEYMAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_INFO_EMURATE_101_KEYBOARD := 16

/**
 * @type {Integer (UInt32)}
 */
export global NLSKBD_INFO_EMURATE_106_KEYBOARD := 32

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_TYPE_NULL := 0

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_TYPE_NORMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_TYPE_TOGGLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_INDEX_NORMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_INDEX_ALT := 2

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_NULL := 0

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_NOEVENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_SEND_BASE_VK := 2

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_SEND_PARAM_VK := 3

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_KANALOCK := 4

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_ALPHANUM := 5

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_HIRAGANA := 6

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_KATAKANA := 7

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_SBCSDBCS := 8

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_ROMAN := 9

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_CODEINPUT := 10

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_HELP_OR_END := 11

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_HOME_OR_CLEAR := 12

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_NUMPAD := 13

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_KANAEVENT := 14

/**
 * @type {Integer (UInt32)}
 */
export global KBDNLS_CONV_OR_NONCONV := 15

/**
 * @type {Integer (UInt32)}
 */
export global KBD_TYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCANCODE_LSHIFT := 42

/**
 * @type {Integer (UInt32)}
 */
export global SCANCODE_RSHIFT := 54

/**
 * @type {Integer (UInt32)}
 */
export global SCANCODE_CTRL := 29

/**
 * @type {Integer (UInt32)}
 */
export global SCANCODE_ALT := 56

/**
 * @type {Integer (UInt32)}
 */
export global SCANCODE_NUMPAD_FIRST := 71

/**
 * @type {Integer (UInt32)}
 */
export global SCANCODE_NUMPAD_LAST := 82

/**
 * @type {Integer (UInt32)}
 */
export global SCANCODE_LWIN := 91

/**
 * @type {Integer (UInt32)}
 */
export global SCANCODE_RWIN := 92

/**
 * @type {Integer (UInt32)}
 */
export global SCANCODE_THAI_LAYOUT_TOGGLE := 41
;@endregion Constants
