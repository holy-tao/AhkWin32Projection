#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify when gamepad bumpers can be used to navigate the top-level navigation items in a NavigationView.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewShoulderNavigationEnabled](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewshouldernavigationenabled) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewshouldernavigationenabled
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewShoulderNavigationEnabled extends Win32Enum{

    /**
     * Gamepad bumpers navigate the top-level navigation items when the [SelectionFollowsFocus](navigationview_selectionfollowsfocus.md) property is **Enabled**.
     * @type {Integer (Int32)}
     */
    static WhenSelectionFollowsFocus => 0

    /**
     * Gamepad bumpers always navigate the top-level navigation items.
     * @type {Integer (Int32)}
     */
    static Always => 1

    /**
     * Gamepad bumpers never navigate the top-level navigation items.
     * @type {Integer (Int32)}
     */
    static Never => 2
}
