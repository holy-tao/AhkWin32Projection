#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgExternalResourcesRequired extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static svgExternalResourcesRequiredFalse => 0

    /**
     * @type {Integer (Int32)}
     */
    static svgExternalResourcesRequiredTrue => 1

    /**
     * @type {Integer (Int32)}
     */
    static svgExternalResourcesRequired_Max => 2147483647
}
