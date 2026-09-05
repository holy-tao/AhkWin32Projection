#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ListViewMode enumeration is used by the View.ListViewMode property to define the list view.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/ne-mmcobj-_listviewmode
 * @namespace Windows.Win32.System.Mmc
 */
class _ListViewMode extends Win32Enum {

    /**
     * The list view is displayed with small icons.
     * Native name: ListMode_Small_Icons
     * @type {Integer (Int32)}
     */
    static Small_Icons => 0

    /**
     * The list view is displayed with large icons.
     * Native name: ListMode_Large_Icons
     * @type {Integer (Int32)}
     */
    static Large_Icons => 1

    /**
     * A simple list view is displayed.
     * Native name: ListMode_List
     * @type {Integer (Int32)}
     */
    static List => 2

    /**
     * A detailed list view is displayed.
     * Native name: ListMode_Detail
     * @type {Integer (Int32)}
     */
    static Detail => 3

    /**
     * A filtered list view is displayed.
     * Native name: ListMode_Filtered
     * @type {Integer (Int32)}
     */
    static Filtered => 4
}
