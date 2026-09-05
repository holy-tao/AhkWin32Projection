#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the type of keys that control the state of a keyboard, such as the Caps Lock key.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_kbd_sync_flag
 * @namespace Windows.Win32.System.DesktopSharing
 */
class RDPSRAPI_KBD_SYNC_FLAG extends Win32Enum {

    /**
     * Native name: RDPSRAPI_KBD_SYNC_FLAG_SCROLL_LOCK
     * @type {Integer (Int32)}
     */
    static SCROLL_LOCK => 1

    /**
     * Native name: RDPSRAPI_KBD_SYNC_FLAG_NUM_LOCK
     * @type {Integer (Int32)}
     */
    static NUM_LOCK => 2

    /**
     * Native name: RDPSRAPI_KBD_SYNC_FLAG_CAPS_LOCK
     * @type {Integer (Int32)}
     */
    static CAPS_LOCK => 4

    /**
     * Native name: RDPSRAPI_KBD_SYNC_FLAG_KANA_LOCK
     * @type {Integer (Int32)}
     */
    static KANA_LOCK => 8
}
