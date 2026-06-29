#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the type of keys that control the state of a keyboard, such as the Caps Lock key.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_kbd_sync_flag
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct RDPSRAPI_KBD_SYNC_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_KBD_SYNC_FLAG_SCROLL_LOCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_KBD_SYNC_FLAG_NUM_LOCK => 2

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_KBD_SYNC_FLAG_CAPS_LOCK => 4

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_KBD_SYNC_FLAG_KANA_LOCK => 8
}
