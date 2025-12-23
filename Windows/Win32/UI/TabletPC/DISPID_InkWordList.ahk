#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkWordList extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkWordList_AddWord => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkWordList_RemoveWord => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkWordList_Merge => 2
}
