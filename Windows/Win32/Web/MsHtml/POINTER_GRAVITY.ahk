#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class POINTER_GRAVITY extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static POINTER_GRAVITY_Left => 0

    /**
     * @type {Integer (Int32)}
     */
    static POINTER_GRAVITY_Right => 1

    /**
     * @type {Integer (Int32)}
     */
    static POINTER_GRAVITY_Max => 2147483647
}
