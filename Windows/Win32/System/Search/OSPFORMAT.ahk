#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class OSPFORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OSPFORMAT_RAW => 0

    /**
     * @type {Integer (Int32)}
     */
    static OSPFORMAT_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static OSPFORMAT_FORMATTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPFORMAT_HTML => 2
}
