#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class QUERYOPTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_EXPIRATION_DATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_TIME_OF_LAST_CHANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_CONTENT_ENCODING => 3

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_CONTENT_TYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_REFRESH => 5

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_RECOMBINE => 6

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_CAN_NAVIGATE => 7

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_USES_NETWORK => 8

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_IS_CACHED => 9

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_IS_INSTALLEDENTRY => 10

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_IS_CACHED_OR_MAPPED => 11

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_USES_CACHE => 12

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_IS_SECURE => 13

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_IS_SAFE => 14

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_USES_HISTORYFOLDER => 15

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_IS_CACHED_AND_USABLE_OFFLINE => 16
}
