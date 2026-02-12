#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether item selection changes when keyboard focus changes in a NavigationView.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewSelectionFollowsFocus](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewselectionfollowsfocus) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewselectionfollowsfocus
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewSelectionFollowsFocus extends Win32Enum{

    /**
     * Selection does not change when keyboard focus changes.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Selection changes when keyboard focus changes.
     * @type {Integer (Int32)}
     */
    static Enabled => 1
}
