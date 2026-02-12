#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the current mode for zoom behavior in the [ScrollViewer](scrollviewer.md) content.
 * @remarks
 * This enumeration provides values for the [ScrollViewer.ZoomMode](scrollviewer_zoommode.md) property. See [ScrollViewer.ZoomMode](scrollviewer_zoommode.md) for more info.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.zoommode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ZoomMode extends Win32Enum{

    /**
     * Zoom of content is disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Zoom of content is enabled.
     * @type {Integer (Int32)}
     */
    static Enabled => 1
}
