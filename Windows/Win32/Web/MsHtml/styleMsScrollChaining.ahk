#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsScrollChaining extends Win32Enum {

    /**
     * Native name: styleMsScrollChainingNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleMsScrollChainingNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleMsScrollChainingChained
     * @type {Integer (Int32)}
     */
    static Chained => 2

    /**
     * Native name: styleMsScrollChaining_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
