#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how panes are shown in a TwoPaneView in tall mode.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneViewTallModeConfiguration](/windows/winui/api/microsoft.ui.xaml.controls.twopaneviewtallmodeconfiguration) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneviewtallmodeconfiguration
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TwoPaneViewTallModeConfiguration extends Win32Enum{

    /**
     * Only the pane that has priority is shown, the other pane is hidden.
     * @type {Integer (Int32)}
     */
    static SinglePane => 0

    /**
     * The pane that has priority is shown on top, the other pane is shown on the bottom.
     * @type {Integer (Int32)}
     */
    static TopBottom => 1

    /**
     * The pane that has priority is shown on the bottom, the other pane is shown on top.
     * @type {Integer (Int32)}
     */
    static BottomTop => 2
}
