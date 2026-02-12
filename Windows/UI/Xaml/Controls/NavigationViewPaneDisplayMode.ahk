#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how and where the NavigationView pane is shown.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewPaneDisplayMode](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewpanedisplaymode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewpanedisplaymode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewPaneDisplayMode extends Win32Enum{

    /**
     * The pane is shown on the left side of the control, and changes between minimal, compact, and full states depending on the width of the window.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The pane is shown on the left side of the control in its fully open state.
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * The pane is shown at the top of the control.
     * @type {Integer (Int32)}
     */
    static Top => 2

    /**
     * The pane is shown on the left side of the control. Only the pane icons are shown by default.
     * @type {Integer (Int32)}
     */
    static LeftCompact => 3

    /**
     * The pane is shown on the left side of the control. Only the pane menu button is shown by default.
     * @type {Integer (Int32)}
     */
    static LeftMinimal => 4
}
