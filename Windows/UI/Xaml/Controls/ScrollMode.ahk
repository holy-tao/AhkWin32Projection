#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify scrolling behavior for [ScrollViewer](scrollviewer.md) and other parts involved in scrolling scenarios.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ScrollMode extends Win32Enum{

    /**
     * Scrolling is disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Scrolling is enabled.
     * @type {Integer (Int32)}
     */
    static Enabled => 1

    /**
     * Scrolling is enabled but behavior uses a "rails" manipulation mode.
     * @type {Integer (Int32)}
     */
    static Auto => 2
}
