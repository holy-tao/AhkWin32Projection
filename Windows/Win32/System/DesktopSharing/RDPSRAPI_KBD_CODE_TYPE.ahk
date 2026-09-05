#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the type of encoding of a keyboard.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_kbd_code_type
 * @namespace Windows.Win32.System.DesktopSharing
 */
class RDPSRAPI_KBD_CODE_TYPE extends Win32Enum {

    /**
     * Native name: RDPSRAPI_KBD_CODE_SCANCODE
     * @type {Integer (Int32)}
     */
    static SCANCODE => 0

    /**
     * Native name: RDPSRAPI_KBD_CODE_UNICODE
     * @type {Integer (Int32)}
     */
    static UNICODE => 1
}
