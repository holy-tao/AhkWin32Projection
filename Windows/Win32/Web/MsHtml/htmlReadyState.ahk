#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlReadyState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyStateuninitialized => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyStateloading => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyStateloaded => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyStateinteractive => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyStatecomplete => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyState_Max => 2147483647
}
