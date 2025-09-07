#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ListViewMode enumeration is used by the View.ListViewMode property to define the list view.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/ne-mmcobj-_listviewmode
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _ListViewMode{

    /**
     * The list view is displayed with small icons.
     * @type {Integer (Int32)}
     */
    static ListMode_Small_Icons => 0

    /**
     * The list view is displayed with large icons.
     * @type {Integer (Int32)}
     */
    static ListMode_Large_Icons => 1

    /**
     * A simple list view is displayed.
     * @type {Integer (Int32)}
     */
    static ListMode_List => 2

    /**
     * A detailed list view is displayed.
     * @type {Integer (Int32)}
     */
    static ListMode_Detail => 3

    /**
     * A filtered list view is displayed.
     * @type {Integer (Int32)}
     */
    static ListMode_Filtered => 4
}
