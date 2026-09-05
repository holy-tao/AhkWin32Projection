#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class POINTER_GRAVITY extends Win32Enum {

    /**
     * Native name: POINTER_GRAVITY_Left
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * Native name: POINTER_GRAVITY_Right
     * @type {Integer (Int32)}
     */
    static Right => 1

    /**
     * Native name: POINTER_GRAVITY_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
