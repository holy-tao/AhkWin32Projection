#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ColorChannelFlags enumeration specifies individual channels in the CMYK (cyan, magenta, yellow, black) color space. This enumeration is used by the ImageAttributes::SetOutputChannel method.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluscolor/ne-gdipluscolor-colorchannelflags
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorChannelFlags extends Win32Enum{

    /**
     * Specifies the cyan color channel.
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsC => 0

    /**
     * Specifies the magenta color channel.
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsM => 1

    /**
     * Specifies the yellow color channel.
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsY => 2

    /**
     * Specifies the black color channel.
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsK => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ColorChannelFlagsLast => 4
}
