#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the type of encoding of a keyboard.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_kbd_code_type
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPSRAPI_KBD_CODE_TYPE{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_KBD_CODE_SCANCODE => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_KBD_CODE_UNICODE => 1
}
