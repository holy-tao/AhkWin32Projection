#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines which aspects of an interpolator depend on a given input.
 * @remarks
 * 
  * Multiple <b>UI_ANIMATION_DEPENDENCIES</b> values can be combined using a bitwise-OR operation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/ne-uianimation-ui_animation_dependencies
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_DEPENDENCIES{

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
