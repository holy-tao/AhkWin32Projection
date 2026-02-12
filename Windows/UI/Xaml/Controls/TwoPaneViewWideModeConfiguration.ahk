#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how panes are shown in a TwoPaneView in wide mode.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneViewWideModeConfiguration](/windows/winui/api/microsoft.ui.xaml.controls.twopaneviewwidemodeconfiguration) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneviewwidemodeconfiguration
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TwoPaneViewWideModeConfiguration extends Win32Enum{

    /**
     * Only the pane that has priority is shown, the other pane is hidden.
     * @type {Integer (Int32)}
     */
    static SinglePane => 0

    /**
     * The pane that has priority is shown on the left, the other pane is shown on the right.
     * @type {Integer (Int32)}
     */
    static LeftRight => 1

    /**
     * The pane that has priority is shown on the right, the other pane is shown on the left.
     * @type {Integer (Int32)}
     */
    static RightLeft => 2
}
