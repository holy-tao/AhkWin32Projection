#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLBWIF_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: HLBWIF_HASFRAMEWNDINFO
     * @type {Integer (Int32)}
     */
    static HASFRAMEWNDINFO => 1

    /**
     * Native name: HLBWIF_HASDOCWNDINFO
     * @type {Integer (Int32)}
     */
    static HASDOCWNDINFO => 2

    /**
     * Native name: HLBWIF_FRAMEWNDMAXIMIZED
     * @type {Integer (Int32)}
     */
    static FRAMEWNDMAXIMIZED => 4

    /**
     * Native name: HLBWIF_DOCWNDMAXIMIZED
     * @type {Integer (Int32)}
     */
    static DOCWNDMAXIMIZED => 8

    /**
     * Native name: HLBWIF_HASWEBTOOLBARINFO
     * @type {Integer (Int32)}
     */
    static HASWEBTOOLBARINFO => 16

    /**
     * Native name: HLBWIF_WEBTOOLBARHIDDEN
     * @type {Integer (Int32)}
     */
    static WEBTOOLBARHIDDEN => 32
}
