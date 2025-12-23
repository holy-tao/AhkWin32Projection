#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_CHARACTER_ATTRIBUTES extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static FOREGROUND_BLUE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static FOREGROUND_GREEN => 2

    /**
     * @type {Integer (UInt16)}
     */
    static FOREGROUND_RED => 4

    /**
     * @type {Integer (UInt16)}
     */
    static FOREGROUND_INTENSITY => 8

    /**
     * @type {Integer (UInt16)}
     */
    static BACKGROUND_BLUE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static BACKGROUND_GREEN => 32

    /**
     * @type {Integer (UInt16)}
     */
    static BACKGROUND_RED => 64

    /**
     * @type {Integer (UInt16)}
     */
    static BACKGROUND_INTENSITY => 128

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_LEADING_BYTE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_TRAILING_BYTE => 512

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_GRID_HORIZONTAL => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_GRID_LVERTICAL => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_GRID_RVERTICAL => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_REVERSE_VIDEO => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_UNDERSCORE => 32768

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_SBCSDBCS => 768
}
