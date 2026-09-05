#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkCursors extends Win32Enum {

    /**
     * Native name: DISPID_ICs_NewEnum
     * @type {Integer (Int32)}
     */
    static ICs_NewEnum => -4

    /**
     * Native name: DISPID_ICsItem
     * @type {Integer (Int32)}
     */
    static ICsItem => 0

    /**
     * Native name: DISPID_ICsCount
     * @type {Integer (Int32)}
     */
    static ICsCount => 1
}
