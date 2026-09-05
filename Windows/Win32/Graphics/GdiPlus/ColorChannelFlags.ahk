#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ColorChannelFlags extends Win32Enum {

    /**
     * Native name: ColorChannelFlagsC
     * @type {Integer (Int32)}
     */
    static FlagsC => 0

    /**
     * Native name: ColorChannelFlagsM
     * @type {Integer (Int32)}
     */
    static FlagsM => 1

    /**
     * Native name: ColorChannelFlagsY
     * @type {Integer (Int32)}
     */
    static FlagsY => 2

    /**
     * Native name: ColorChannelFlagsK
     * @type {Integer (Int32)}
     */
    static FlagsK => 3

    /**
     * Native name: ColorChannelFlagsLast
     * @type {Integer (Int32)}
     */
    static Last => 4
}
