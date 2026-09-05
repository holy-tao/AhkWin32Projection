#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsContentZoomChaining extends Win32Enum {

    /**
     * Native name: styleMsContentZoomChainingNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleMsContentZoomChainingNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleMsContentZoomChainingChained
     * @type {Integer (Int32)}
     */
    static Chained => 2

    /**
     * Native name: styleMsContentZoomChaining_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
