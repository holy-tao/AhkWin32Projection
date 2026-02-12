#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how panes are shown in a TwoPaneView.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneViewMode](/windows/winui/api/microsoft.ui.xaml.controls.twopaneviewmode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneviewmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TwoPaneViewMode extends Win32Enum{

    /**
     * Only one pane is shown.
     * @type {Integer (Int32)}
     */
    static SinglePane => 0

    /**
     * Panes are shown side-by-side.
     * @type {Integer (Int32)}
     */
    static Wide => 1

    /**
     * Panes are shown top-bottom.
     * @type {Integer (Int32)}
     */
    static Tall => 2
}
