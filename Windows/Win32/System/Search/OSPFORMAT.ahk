#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class OSPFORMAT extends Win32Enum {

    /**
     * Native name: OSPFORMAT_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 0

    /**
     * Native name: OSPFORMAT_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: OSPFORMAT_FORMATTED
     * @type {Integer (Int32)}
     */
    static FORMATTED => 1

    /**
     * Native name: OSPFORMAT_HTML
     * @type {Integer (Int32)}
     */
    static HTML => 2
}
