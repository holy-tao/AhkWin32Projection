#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the visual state of a window.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-windowvisualstate
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct WindowVisualState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
