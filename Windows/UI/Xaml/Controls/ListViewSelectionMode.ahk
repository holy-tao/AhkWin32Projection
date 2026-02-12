#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the selection mode of a [ListView](listview.md) or [GridView](gridview.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewselectionmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListViewSelectionMode extends Win32Enum{

    /**
     * A user can't select items.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A user can select a single item.
     * @type {Integer (Int32)}
     */
    static Single => 1

    /**
     * The user can select multiple items without entering a special mode.
     * @type {Integer (Int32)}
     */
    static Multiple => 2

    /**
     * The user can select multiple items by entering a special mode, for example when depressing a modifier key.
     * @type {Integer (Int32)}
     */
    static Extended => 3
}
