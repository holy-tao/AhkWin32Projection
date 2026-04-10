#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsScrollChaining extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollChainingNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollChainingNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollChainingChained => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollChaining_Max => 2147483647
}
