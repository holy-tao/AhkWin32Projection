#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the current state of the window for purposes of user interaction.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-windowinteractionstate
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct WindowInteractionState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The window is running. This does not guarantee that the window is ready for user interaction or is responding.
     * @type {Integer (Int32)}
     */
    static WindowInteractionState_Running => 0

    /**
     * The window is closing.
     * @type {Integer (Int32)}
     */
    static WindowInteractionState_Closing => 1

    /**
     * The window is ready for user interaction.
     * @type {Integer (Int32)}
     */
    static WindowInteractionState_ReadyForUserInteraction => 2

    /**
     * The window is blocked by a modal window.
     * @type {Integer (Int32)}
     */
    static WindowInteractionState_BlockedByModalWindow => 3

    /**
     * The window is not responding.
     * @type {Integer (Int32)}
     */
    static WindowInteractionState_NotResponding => 4
}
