#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the type of encoding of a keyboard.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_kbd_code_type
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct RDPSRAPI_KBD_CODE_TYPE {
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
    static RDPSRAPI_KBD_CODE_SCANCODE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_KBD_CODE_UNICODE => 1
}
