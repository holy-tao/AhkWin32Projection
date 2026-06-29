#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines which aspects of an interpolator depend on a given input.
 * @remarks
 * Multiple <b>UI_ANIMATION_DEPENDENCIES</b> values can be combined using a bitwise-OR operation.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_dependencies
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_DEPENDENCIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No aspect depends on the input.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_DEPENDENCY_NONE => 0

    /**
     * The intermediate values depend on the input.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_DEPENDENCY_INTERMEDIATE_VALUES => 1

    /**
     * The final value depends on the input.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_DEPENDENCY_FINAL_VALUE => 2

    /**
     * The final velocity depends on the input.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_DEPENDENCY_FINAL_VELOCITY => 4

    /**
     * The duration depends on the input.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_DEPENDENCY_DURATION => 8
}
