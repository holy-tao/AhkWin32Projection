#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the behavior of a timer when the animation manager is idle.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_idle_behavior
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_IDLE_BEHAVIOR{

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
