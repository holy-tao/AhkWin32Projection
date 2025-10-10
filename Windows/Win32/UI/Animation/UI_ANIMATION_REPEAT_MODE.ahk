#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the pattern for a loop iteration.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/ne-uianimation-ui_animation_repeat_mode
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_REPEAT_MODE{

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
