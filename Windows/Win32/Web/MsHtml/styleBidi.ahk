#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBidi extends Win32Enum {

    /**
     * Native name: styleBidiNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleBidiNormal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: styleBidiEmbed
     * @type {Integer (Int32)}
     */
    static Embed => 2

    /**
     * Native name: styleBidiOverride
     * @type {Integer (Int32)}
     */
    static Override => 3

    /**
     * Native name: styleBidiInherit
     * @type {Integer (Int32)}
     */
    static Inherit => 4

    /**
     * Native name: styleBidi_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
