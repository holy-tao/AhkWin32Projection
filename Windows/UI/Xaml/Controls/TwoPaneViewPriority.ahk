#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify which pane has priority in a TwoPaneView.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TwoPaneViewPriority](/windows/winui/api/microsoft.ui.xaml.controls.twopaneviewpriority) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.twopaneviewpriority
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TwoPaneViewPriority extends Win32Enum{

    /**
     * Pane 1 has priority.
     * @type {Integer (Int32)}
     */
    static Pane1 => 0

    /**
     * Pane 2 has priority.
     * @type {Integer (Int32)}
     */
    static Pane2 => 1
}
