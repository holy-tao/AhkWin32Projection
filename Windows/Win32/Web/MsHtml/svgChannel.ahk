#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgChannel extends Win32Enum {

    /**
     * Native name: SVG_CHANNEL_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_CHANNEL_R
     * @type {Integer (Int32)}
     */
    static R => 1

    /**
     * Native name: SVG_CHANNEL_G
     * @type {Integer (Int32)}
     */
    static G => 2

    /**
     * Native name: SVG_CHANNEL_B
     * @type {Integer (Int32)}
     */
    static B => 3

    /**
     * Native name: SVG_CHANNEL_A
     * @type {Integer (Int32)}
     */
    static A => 4

    /**
     * Native name: svgChannel_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
