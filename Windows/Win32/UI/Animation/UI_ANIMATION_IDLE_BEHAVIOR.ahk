#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the behavior of a timer when the animation manager is idle.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_idle_behavior
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_IDLE_BEHAVIOR {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The timer continues to generate timer events (is enabled) when the animation manager is idle.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_IDLE_BEHAVIOR_CONTINUE => 0

    /**
     * The timer is suspended (disabled) when the animation manager is idle.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_IDLE_BEHAVIOR_DISABLE => 1
}
