#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the label for the overflow button in a NavigationView.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewOverflowLabelMode](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewoverflowlabelmode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * The overflow menu is shown only when [NavigationView.PaneDisplayMode](navigationviewpanedisplaymode.md) is **Top** and the window is not wide enough to show all navigation menu items.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewoverflowlabelmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewOverflowLabelMode extends Win32Enum{

    /**
     * The text label "More" is shown next to the chevron.
     * @type {Integer (Int32)}
     */
    static MoreLabel => 0

    /**
     * No text label is shown, only a chevron.
     * @type {Integer (Int32)}
     */
    static NoLabel => 1
}
