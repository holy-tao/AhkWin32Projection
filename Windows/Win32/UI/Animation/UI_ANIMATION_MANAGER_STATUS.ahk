#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the activity status of an animation manager.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_manager_status
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_MANAGER_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The animation manager is idle; no animations are currently playing.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MANAGER_IDLE => 0

    /**
     * The animation manager is busy; at least one animation is currently playing or scheduled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MANAGER_BUSY => 1
}
