#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleFontVariant extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleFontVariantNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFontVariantSmallCaps => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFontVariantNormal => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFontVariant_Max => 2147483647
}
