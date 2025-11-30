#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by THUMBBUTTON to control specific states and behaviors of the button.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-thumbbuttonflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class THUMBBUTTONFLAGS extends Win32BitflagEnum{

    /**
     * The button is active and available to the user.
     * @type {Integer (Int32)}
     */
    static THBF_ENABLED => 0

    /**
     * The button is disabled. It is present, but has a visual state that indicates that it will not respond to user action.
     * @type {Integer (Int32)}
     */
    static THBF_DISABLED => 1

    /**
     * When the button is clicked, the taskbar button's flyout closes immediately.
     * @type {Integer (Int32)}
     */
    static THBF_DISMISSONCLICK => 2

    /**
     * Do not draw a button border, use only the image.
     * @type {Integer (Int32)}
     */
    static THBF_NOBACKGROUND => 4

    /**
     * The button is not shown to the user.
     * @type {Integer (Int32)}
     */
    static THBF_HIDDEN => 8

    /**
     * The button is enabled but not interactive; no pressed button state is drawn. This value is intended for instances where the button is used in a notification.
     * @type {Integer (Int32)}
     */
    static THBF_NONINTERACTIVE => 16
}
