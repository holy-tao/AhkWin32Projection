#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the reorder mode of a [ListView](listview.md) or [GridView](gridview.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewreordermode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListViewReorderMode extends Win32Enum{

    /**
     * A user can't reorder the list.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * A user can reorder the list.
     * @type {Integer (Int32)}
     */
    static Enabled => 1
}
