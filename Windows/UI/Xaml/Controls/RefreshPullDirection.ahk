#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the direction to pull a [RefreshContainer](refreshcontainer.md) to initiate a refresh.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshPullDirection](/windows/winui/api/microsoft.ui.xaml.controls.refreshpulldirection) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * This enumeration provides values for the [RefreshContainer.PullDirection](refreshcontainer_pulldirection.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshpulldirection
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RefreshPullDirection extends Win32Enum{

    /**
     * Pull from left to right to initiate a refresh.
     * @type {Integer (Int32)}
     */
    static LeftToRight => 0

    /**
     * Pull from top to bottom to initiate a refresh.
     * @type {Integer (Int32)}
     */
    static TopToBottom => 1

    /**
     * Pull from right to left to initiate a refresh.
     * @type {Integer (Int32)}
     */
    static RightToLeft => 2

    /**
     * Pull from bottom to top to initiate a refresh.
     * @type {Integer (Int32)}
     */
    static BottomToTop => 3
}
