#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the state of a [RefreshVisualizer](refreshvisualizer.md)
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizerState](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizerstate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizerstate
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RefreshVisualizerState extends Win32Enum{

    /**
     * The visualizer is idle.
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * The visualizer was pulled in the refresh direction from a position where a refresh is not allowed. Typically, the ScrollViewer was not at position 0 at the start of the pull.
     * @type {Integer (Int32)}
     */
    static Peeking => 1

    /**
     * The user is interacting with the visualizer.
     * @type {Integer (Int32)}
     */
    static Interacting => 2

    /**
     * The visualizer is pending.
     * @type {Integer (Int32)}
     */
    static Pending => 3

    /**
     * The visualizer is being refreshed.
     * @type {Integer (Int32)}
     */
    static Refreshing => 4
}
