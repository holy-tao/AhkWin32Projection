#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsContentZoomChaining extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomChainingNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomChainingNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomChainingChained => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomChaining_Max => 2147483647
}
