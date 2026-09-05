#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkWordList extends Win32Enum {

    /**
     * Native name: DISPID_InkWordList_AddWord
     * @type {Integer (Int32)}
     */
    static AddWord => 0

    /**
     * Native name: DISPID_InkWordList_RemoveWord
     * @type {Integer (Int32)}
     */
    static RemoveWord => 1

    /**
     * Native name: DISPID_InkWordList_Merge
     * @type {Integer (Int32)}
     */
    static Merge => 2
}
