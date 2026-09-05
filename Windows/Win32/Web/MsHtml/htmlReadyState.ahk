#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlReadyState extends Win32Enum {

    /**
     * Native name: htmlReadyStateuninitialized
     * @type {Integer (Int32)}
     */
    static Stateuninitialized => 0

    /**
     * Native name: htmlReadyStateloading
     * @type {Integer (Int32)}
     */
    static Stateloading => 1

    /**
     * Native name: htmlReadyStateloaded
     * @type {Integer (Int32)}
     */
    static Stateloaded => 2

    /**
     * Native name: htmlReadyStateinteractive
     * @type {Integer (Int32)}
     */
    static Stateinteractive => 3

    /**
     * Native name: htmlReadyStatecomplete
     * @type {Integer (Int32)}
     */
    static Statecomplete => 4

    /**
     * Native name: htmlReadyState_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
