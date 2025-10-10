#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the visual state of a window.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-windowvisualstate
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class WindowVisualState{

    /**
     * The window is normal (restored).
     * @type {Integer (Int32)}
     */
    static WindowVisualState_Normal => 0

    /**
     * The window is maximized.
     * @type {Integer (Int32)}
     */
    static WindowVisualState_Maximized => 1

    /**
     * The window is minimized.
     * @type {Integer (Int32)}
     */
    static WindowVisualState_Minimized => 2
}
