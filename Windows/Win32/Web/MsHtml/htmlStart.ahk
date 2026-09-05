#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlStart extends Win32Enum {

    /**
     * Native name: htmlStartfileopen
     * @type {Integer (Int32)}
     */
    static Startfileopen => 0

    /**
     * Native name: htmlStartmouseover
     * @type {Integer (Int32)}
     */
    static Startmouseover => 1

    /**
     * Native name: htmlStart_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
