#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the starting position of a [RefreshVisualizer](refreshvisualizer.md)'s progress spinner.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RefreshVisualizerOrientation](/windows/winui/api/microsoft.ui.xaml.controls.refreshvisualizerorientation) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.refreshvisualizerorientation
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RefreshVisualizerOrientation extends Win32Enum{

    /**
     * The progress spinner automatically rotates so the arrow starts in the appropriate position for the [PullDirection](refreshcontainer_pulldirection.md).
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The progress spinner default position.
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * The progress spinner is rotated 90 degrees counter-clockwise from Normal.
     * @type {Integer (Int32)}
     */
    static Rotate90DegreesCounterclockwise => 2

    /**
     * The progress spinner is rotated 270 degrees counter-clockwise from Normal.
     * @type {Integer (Int32)}
     */
    static Rotate270DegreesCounterclockwise => 3
}
