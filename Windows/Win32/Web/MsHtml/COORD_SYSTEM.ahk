#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class COORD_SYSTEM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_GLOBAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_PARENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_CONTAINER => 2

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_CONTENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_FRAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_CLIENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static COORD_SYSTEM_Max => 2147483647
}
