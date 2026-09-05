#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleFontVariant extends Win32Enum {

    /**
     * Native name: styleFontVariantNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleFontVariantSmallCaps
     * @type {Integer (Int32)}
     */
    static SmallCaps => 1

    /**
     * Native name: styleFontVariantNormal
     * @type {Integer (Int32)}
     */
    static Normal => 2

    /**
     * Native name: styleFontVariant_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
