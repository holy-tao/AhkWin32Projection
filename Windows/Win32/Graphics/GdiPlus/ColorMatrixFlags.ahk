#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ColorMatrixFlags extends Win32Enum {

    /**
     * Native name: ColorMatrixFlagsDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: ColorMatrixFlagsSkipGrays
     * @type {Integer (Int32)}
     */
    static SkipGrays => 1

    /**
     * Native name: ColorMatrixFlagsAltGray
     * @type {Integer (Int32)}
     */
    static AltGray => 2
}
