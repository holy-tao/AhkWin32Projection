#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkCursorButtons extends Win32Enum {

    /**
     * Native name: DISPID_ICBs_NewEnum
     * @type {Integer (Int32)}
     */
    static ICBs_NewEnum => -4

    /**
     * Native name: DISPID_ICBsItem
     * @type {Integer (Int32)}
     */
    static ICBsItem => 0

    /**
     * Native name: DISPID_ICBsCount
     * @type {Integer (Int32)}
     */
    static ICBsCount => 1
}
