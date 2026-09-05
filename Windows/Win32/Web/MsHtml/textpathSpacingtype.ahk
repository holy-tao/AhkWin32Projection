#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class textpathSpacingtype extends Win32Enum {

    /**
     * Native name: TEXTPATH_SPACINGTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: TEXTPATH_SPACINGTYPE_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 1

    /**
     * Native name: TEXTPATH_SPACINGTYPE_EXACT
     * @type {Integer (Int32)}
     */
    static EXACT => 2

    /**
     * Native name: textpathSpacingtype_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
