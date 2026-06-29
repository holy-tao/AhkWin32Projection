#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the pattern for a loop iteration.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_repeat_mode
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_REPEAT_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The start of a  loop begins with the first value (v1-&gt;v2, v1-&gt;v2, v1-&gt;v2, and so on).
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_REPEAT_MODE_NORMAL => 0

    /**
     * The  start of a loop alternates between values (v1-&gt;v2, v2-&gt;v1, v1-&gt;v2, and so on).
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_REPEAT_MODE_ALTERNATE => 1
}
