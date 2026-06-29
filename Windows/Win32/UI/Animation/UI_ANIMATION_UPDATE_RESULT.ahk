#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines results for animation updates.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_update_result
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_UPDATE_RESULT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No animation variables have changed.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_UPDATE_NO_CHANGE => 0

    /**
     * One or more animation variables has changed.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_UPDATE_VARIABLES_CHANGED => 1
}
