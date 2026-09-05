#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class textpathMethodtype extends Win32Enum {

    /**
     * Native name: TEXTPATH_METHODTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: TEXTPATH_METHODTYPE_ALIGN
     * @type {Integer (Int32)}
     */
    static ALIGN => 1

    /**
     * Native name: TEXTPATH_METHODTYPE_STRETCH
     * @type {Integer (Int32)}
     */
    static STRETCH => 2

    /**
     * Native name: textpathMethodtype_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
