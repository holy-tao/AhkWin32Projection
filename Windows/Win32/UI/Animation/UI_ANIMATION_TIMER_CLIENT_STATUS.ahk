#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines activity status for a timer's client.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_timer_client_status
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_TIMER_CLIENT_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The client is idle.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_TIMER_CLIENT_IDLE => 0

    /**
     * The client is busy.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_TIMER_CLIENT_BUSY => 1
}
