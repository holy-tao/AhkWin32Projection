#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the pattern for a loop iteration.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_repeat_mode
 * @namespace Windows.Win32.UI.Animation
 */
class UI_ANIMATION_REPEAT_MODE extends Win32Enum {

    /**
     * The start of a  loop begins with the first value (v1-&gt;v2, v1-&gt;v2, v1-&gt;v2, and so on).
     * Native name: UI_ANIMATION_REPEAT_MODE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * The  start of a loop alternates between values (v1-&gt;v2, v2-&gt;v1, v1-&gt;v2, and so on).
     * Native name: UI_ANIMATION_REPEAT_MODE_ALTERNATE
     * @type {Integer (Int32)}
     */
    static ALTERNATE => 1
}
