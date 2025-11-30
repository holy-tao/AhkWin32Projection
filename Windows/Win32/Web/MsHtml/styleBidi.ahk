#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleBidi extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleBidiNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBidiNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBidiEmbed => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBidiOverride => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBidiInherit => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleBidi_Max => 2147483647
}
