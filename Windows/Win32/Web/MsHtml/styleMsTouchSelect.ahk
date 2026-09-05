#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsTouchSelect extends Win32Enum {

    /**
     * Native name: styleMsTouchSelectGrippers
     * @type {Integer (Int32)}
     */
    static Grippers => 0

    /**
     * Native name: styleMsTouchSelectNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleMsTouchSelectNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleMsTouchSelect_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
