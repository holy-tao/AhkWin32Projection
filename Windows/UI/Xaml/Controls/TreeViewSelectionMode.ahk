#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the selection behavior for a [TreeView](treeview.md) instance.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewSelectionMode](/windows/winui/api/microsoft.ui.xaml.controls.treeviewselectionmode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewselectionmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewSelectionMode extends Win32Enum{

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
     * The user can select multiple items.
     * @type {Integer (Int32)}
     */
    static Multiple => 2
}
