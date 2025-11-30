#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class svgChannel extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVG_CHANNEL_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_CHANNEL_R => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_CHANNEL_G => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVG_CHANNEL_B => 3

    /**
     * @type {Integer (Int32)}
     */
    static SVG_CHANNEL_A => 4

    /**
     * @type {Integer (Int32)}
     */
    static svgChannel_Max => 2147483647
}
