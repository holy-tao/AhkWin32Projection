#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the type of mouse buttons.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_mouse_button_type
 * @namespace Windows.Win32.System.DesktopSharing
 */
class RDPSRAPI_MOUSE_BUTTON_TYPE extends Win32Enum {

    /**
     * Native name: RDPSRAPI_MOUSE_BUTTON_BUTTON1
     * @type {Integer (Int32)}
     */
    static BUTTON1 => 0

    /**
     * Native name: RDPSRAPI_MOUSE_BUTTON_BUTTON2
     * @type {Integer (Int32)}
     */
    static BUTTON2 => 1

    /**
     * Native name: RDPSRAPI_MOUSE_BUTTON_BUTTON3
     * @type {Integer (Int32)}
     */
    static BUTTON3 => 2

    /**
     * Native name: RDPSRAPI_MOUSE_BUTTON_XBUTTON1
     * @type {Integer (Int32)}
     */
    static XBUTTON1 => 3

    /**
     * Native name: RDPSRAPI_MOUSE_BUTTON_XBUTTON2
     * @type {Integer (Int32)}
     */
    static XBUTTON2 => 4

    /**
     * Native name: RDPSRAPI_MOUSE_BUTTON_XBUTTON3
     * @type {Integer (Int32)}
     */
    static XBUTTON3 => 5
}
