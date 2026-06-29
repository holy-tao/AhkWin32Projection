#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global VDMCONTEXT_i386 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global VDMCONTEXT_i486 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global VDM_KGDT_R3_CODE := 24

/**
 * @type {Integer (UInt32)}
 */
export global VDM_MAXIMUM_SUPPORTED_EXTENSION := 512

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_CARRY := 1

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_PARITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_AUXCARRY := 16

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_ZERO := 64

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_SIGN := 128

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_TRACE := 256

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_INTERRUPT := 512

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_DIRECTION := 1024

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_OVERFLOW := 2048

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_IOPL := 12288

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_IOPL_BITS := 18

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_RESUME := 65536

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_V86 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global V86FLAGS_ALIGNMENT := 262144

/**
 * @type {Integer (Int32)}
 */
export global STATUS_VDM_EVENT := 1073741829

/**
 * @type {Integer (UInt32)}
 */
export global DBG_SEGLOAD := 0

/**
 * @type {Integer (UInt32)}
 */
export global DBG_SEGMOVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBG_SEGFREE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBG_MODLOAD := 3

/**
 * @type {Integer (UInt32)}
 */
export global DBG_MODFREE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBG_SINGLESTEP := 5

/**
 * @type {Integer (UInt32)}
 */
export global DBG_BREAK := 6

/**
 * @type {Integer (UInt32)}
 */
export global DBG_GPFAULT := 7

/**
 * @type {Integer (UInt32)}
 */
export global DBG_DIVOVERFLOW := 8

/**
 * @type {Integer (UInt32)}
 */
export global DBG_INSTRFAULT := 9

/**
 * @type {Integer (UInt32)}
 */
export global DBG_TASKSTART := 10

/**
 * @type {Integer (UInt32)}
 */
export global DBG_TASKSTOP := 11

/**
 * @type {Integer (UInt32)}
 */
export global DBG_DLLSTART := 12

/**
 * @type {Integer (UInt32)}
 */
export global DBG_DLLSTOP := 13

/**
 * @type {Integer (UInt32)}
 */
export global DBG_ATTACH := 14

/**
 * @type {Integer (UInt32)}
 */
export global DBG_TOOLHELP := 15

/**
 * @type {Integer (UInt32)}
 */
export global DBG_STACKFAULT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DBG_WOWINIT := 17

/**
 * @type {Integer (UInt32)}
 */
export global DBG_TEMPBP := 18

/**
 * @type {Integer (UInt32)}
 */
export global DBG_MODMOVE := 19

/**
 * @type {Integer (UInt32)}
 */
export global DBG_INIT := 20

/**
 * @type {Integer (UInt32)}
 */
export global DBG_GPFAULT2 := 21

/**
 * @type {Integer (UInt32)}
 */
export global VDMEVENT_NEEDS_INTERACTIVE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global VDMEVENT_VERBOSE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global VDMEVENT_PE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global VDMEVENT_ALLFLAGS := 57344

/**
 * @type {Integer (UInt32)}
 */
export global VDMEVENT_V86 := 1

/**
 * @type {Integer (UInt32)}
 */
export global VDMEVENT_PM16 := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_MODULE_NAME := 9

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PATH16 := 255

/**
 * @type {Integer (UInt32)}
 */
export global SN_CODE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SN_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global SN_V86 := 2

/**
 * @type {Integer (UInt32)}
 */
export global GLOBAL_ALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global GLOBAL_LRU := 1

/**
 * @type {Integer (UInt32)}
 */
export global GLOBAL_FREE := 2

/**
 * @type {Integer (UInt32)}
 */
export global GT_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global GT_DGROUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global GT_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global GT_CODE := 3

/**
 * @type {Integer (UInt32)}
 */
export global GT_TASK := 4

/**
 * @type {Integer (UInt32)}
 */
export global GT_RESOURCE := 5

/**
 * @type {Integer (UInt32)}
 */
export global GT_MODULE := 6

/**
 * @type {Integer (UInt32)}
 */
export global GT_FREE := 7

/**
 * @type {Integer (UInt32)}
 */
export global GT_INTERNAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global GT_SENTINEL := 9

/**
 * @type {Integer (UInt32)}
 */
export global GT_BURGERMASTER := 10

/**
 * @type {Integer (UInt32)}
 */
export global GD_USERDEFINED := 0

/**
 * @type {Integer (UInt32)}
 */
export global GD_CURSORCOMPONENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global GD_BITMAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global GD_ICONCOMPONENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global GD_MENU := 4

/**
 * @type {Integer (UInt32)}
 */
export global GD_DIALOG := 5

/**
 * @type {Integer (UInt32)}
 */
export global GD_STRING := 6

/**
 * @type {Integer (UInt32)}
 */
export global GD_FONTDIR := 7

/**
 * @type {Integer (UInt32)}
 */
export global GD_FONT := 8

/**
 * @type {Integer (UInt32)}
 */
export global GD_ACCELERATORS := 9

/**
 * @type {Integer (UInt32)}
 */
export global GD_RCDATA := 10

/**
 * @type {Integer (UInt32)}
 */
export global GD_ERRTABLE := 11

/**
 * @type {Integer (UInt32)}
 */
export global GD_CURSOR := 12

/**
 * @type {Integer (UInt32)}
 */
export global GD_ICON := 14

/**
 * @type {Integer (UInt32)}
 */
export global GD_NAMETABLE := 15

/**
 * @type {Integer (UInt32)}
 */
export global GD_MAX_RESOURCE := 15

/**
 * @type {Integer (UInt32)}
 */
export global WOW_SYSTEM := 1

/**
 * @type {Integer (UInt32)}
 */
export global VDMDBG_BREAK_DOSTASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global VDMDBG_BREAK_WOWTASK := 2

/**
 * @type {Integer (UInt32)}
 */
export global VDMDBG_BREAK_LOADDLL := 4

/**
 * @type {Integer (UInt32)}
 */
export global VDMDBG_BREAK_EXCEPTIONS := 8

/**
 * @type {Integer (UInt32)}
 */
export global VDMDBG_BREAK_DEBUGGER := 16

/**
 * @type {Integer (UInt32)}
 */
export global VDMDBG_TRACE_HISTORY := 128

/**
 * @type {Integer (UInt32)}
 */
export global VDMDBG_BREAK_DIVIDEBYZERO := 256

/**
 * @type {Integer (UInt32)}
 */
export global VDMDBG_INITIAL_FLAGS := 256

/**
 * @type {Integer (UInt32)}
 */
export global VDMDBG_MAX_SYMBOL_BUFFER := 256

/**
 * @type {Integer (UInt32)}
 */
export global VDMADDR_V86 := 2

/**
 * @type {Integer (UInt32)}
 */
export global VDMADDR_PM16 := 4

/**
 * @type {Integer (UInt32)}
 */
export global VDMADDR_PM32 := 16
;@endregion Constants
