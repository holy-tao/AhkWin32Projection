#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ColorChannelFlags extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsC => 0

    /**
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsM => 1

    /**
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsY => 2

    /**
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsK => 3

    /**
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsLast => 4
}
