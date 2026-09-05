#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkCustomStrokes extends Win32Enum {

    /**
     * Native name: DISPID_ICSs_NewEnum
     * @type {Integer (Int32)}
     */
    static ICSs_NewEnum => -4

    /**
     * Native name: DISPID_ICSsItem
     * @type {Integer (Int32)}
     */
    static ICSsItem => 0

    /**
     * Native name: DISPID_ICSsCount
     * @type {Integer (Int32)}
     */
    static ICSsCount => 1

    /**
     * Native name: DISPID_ICSsAdd
     * @type {Integer (Int32)}
     */
    static ICSsAdd => 2

    /**
     * Native name: DISPID_ICSsRemove
     * @type {Integer (Int32)}
     */
    static ICSsRemove => 3

    /**
     * Native name: DISPID_ICSsClear
     * @type {Integer (Int32)}
     */
    static ICSsClear => 4
}
