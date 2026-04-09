#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkCursors extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICs_NewEnum => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsCount => 1
}
