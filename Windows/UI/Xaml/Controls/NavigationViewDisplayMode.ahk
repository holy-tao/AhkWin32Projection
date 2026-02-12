#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the pane is shown in a NavigationView.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewDisplayMode](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewdisplaymode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewdisplaymode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewDisplayMode extends Win32Enum{

    /**
     * Only the menu button remains fixed. The pane shows and hides as needed.
     * @type {Integer (Int32)}
     */
    static Minimal => 0

    /**
     * The pane always shows as a narrow sliver which can be opened to full width.
     * @type {Integer (Int32)}
     */
    static Compact => 1

    /**
     * The pane stays open alongside the content.
     * @type {Integer (Int32)}
     */
    static Expanded => 2
}
