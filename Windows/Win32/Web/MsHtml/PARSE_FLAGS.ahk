#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class PARSE_FLAGS extends Win32Enum {

    /**
     * Native name: PARSE_ABSOLUTIFYIE40URLS
     * @type {Integer (Int32)}
     */
    static ABSOLUTIFYIE40URLS => 1

    /**
     * Native name: PARSE_DISABLEVML
     * @type {Integer (Int32)}
     */
    static DISABLEVML => 2

    /**
     * Native name: PARSE_FLAGS_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
