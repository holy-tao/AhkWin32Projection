#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ADDURL_FLAG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ADDURL_FIRST => 0

    /**
     * @type {Integer (Int32)}
     */
    static ADDURL_ADDTOHISTORYANDCACHE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ADDURL_ADDTOCACHE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ADDURL_Max => 2147483647
}
