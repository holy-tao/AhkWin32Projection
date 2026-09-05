#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the visual state of a window.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-windowvisualstate
 * @namespace Windows.Win32.UI.Accessibility
 */
class WindowVisualState extends Win32Enum {

    /**
     * The window is normal (restored).
     * Native name: WindowVisualState_Normal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The window is maximized.
     * Native name: WindowVisualState_Maximized
     * @type {Integer (Int32)}
     */
    static Maximized => 1

    /**
     * The window is minimized.
     * Native name: WindowVisualState_Minimized
     * @type {Integer (Int32)}
     */
    static Minimized => 2
}
