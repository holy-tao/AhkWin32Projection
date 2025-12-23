#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Characters are underlined.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-charformata
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class CFE_UNDERLINE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_CF1UNDERLINE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_INVERT => 254

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINETHICKLONGDASH => 18

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINETHICKDOTTED => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINETHICKDASHDOTDOT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINETHICKDASHDOT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINETHICKDASH => 14

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINELONGDASH => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEHEAVYWAVE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEDOUBLEWAVE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEHAIRLINE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINETHICK => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEWAVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEDASHDOTDOT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEDASHDOT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEDASH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEDOTTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEDOUBLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINEWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CFU_UNDERLINENONE => 0
}
