#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines animation modes.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_mode
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Animation is disabled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MODE_DISABLED => 0

    /**
     * The animation mode is managed by the system.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MODE_SYSTEM_DEFAULT => 1

    /**
     * Animation is enabled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MODE_ENABLED => 2
}
