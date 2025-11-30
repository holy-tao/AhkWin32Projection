#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines activity status for a timer's client.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/ne-uianimation-ui_animation_timer_client_status
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_TIMER_CLIENT_STATUS extends Win32Enum{

    /**
     * The client is idle.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_TIMER_CLIENT_IDLE => 0

    /**
     * The client is busy.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_TIMER_CLIENT_BUSY => 1
}
