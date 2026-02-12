#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the visual state of a window for the [IWindowProvider](../windows.ui.xaml.automation.provider/iwindowprovider.md) pattern.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.windowvisualstate
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class WindowVisualState extends Win32Enum{

    /**
     * Specifies that the window is normal (restored).
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Specifies that the window is maximized.
     * @type {Integer (Int32)}
     */
    static Maximized => 1

    /**
     * Specifies that the window is minimized.
     * @type {Integer (Int32)}
     */
    static Minimized => 2
}
