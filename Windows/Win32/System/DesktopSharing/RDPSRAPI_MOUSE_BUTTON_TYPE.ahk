#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the type of mouse buttons.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpsrapi_mouse_button_type
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct RDPSRAPI_MOUSE_BUTTON_TYPE {
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
    static RDPSRAPI_MOUSE_BUTTON_BUTTON1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_MOUSE_BUTTON_BUTTON2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_MOUSE_BUTTON_BUTTON3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_MOUSE_BUTTON_XBUTTON1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_MOUSE_BUTTON_XBUTTON2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static RDPSRAPI_MOUSE_BUTTON_XBUTTON3 => 5
}
