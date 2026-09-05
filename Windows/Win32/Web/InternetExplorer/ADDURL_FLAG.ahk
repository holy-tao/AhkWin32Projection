#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class ADDURL_FLAG extends Win32Enum {

    /**
     * Native name: ADDURL_FIRST
     * @type {Integer (Int32)}
     */
    static FIRST => 0

    /**
     * Native name: ADDURL_ADDTOHISTORYANDCACHE
     * @type {Integer (Int32)}
     */
    static ADDTOHISTORYANDCACHE => 0

    /**
     * Native name: ADDURL_ADDTOCACHE
     * @type {Integer (Int32)}
     */
    static ADDTOCACHE => 1

    /**
     * Native name: ADDURL_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
