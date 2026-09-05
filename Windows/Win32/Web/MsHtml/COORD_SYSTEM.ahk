#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class COORD_SYSTEM extends Win32Enum {

    /**
     * Native name: COORD_SYSTEM_GLOBAL
     * @type {Integer (Int32)}
     */
    static GLOBAL => 0

    /**
     * Native name: COORD_SYSTEM_PARENT
     * @type {Integer (Int32)}
     */
    static PARENT => 1

    /**
     * Native name: COORD_SYSTEM_CONTAINER
     * @type {Integer (Int32)}
     */
    static CONTAINER => 2

    /**
     * Native name: COORD_SYSTEM_CONTENT
     * @type {Integer (Int32)}
     */
    static CONTENT => 3

    /**
     * Native name: COORD_SYSTEM_FRAME
     * @type {Integer (Int32)}
     */
    static FRAME => 4

    /**
     * Native name: COORD_SYSTEM_CLIENT
     * @type {Integer (Int32)}
     */
    static CLIENT => 5

    /**
     * Native name: COORD_SYSTEM_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
