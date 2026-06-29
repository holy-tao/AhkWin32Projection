#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The type of device that sent the input message.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-input_message_device_type
 * @namespace Windows.Win32.UI.Input
 */
export default struct INPUT_MESSAGE_DEVICE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The device type isn't identified.
     * @type {Integer (Int32)}
     */
    static IMDT_UNAVAILABLE => 0

    /**
     * Keyboard input.
     * @type {Integer (Int32)}
     */
    static IMDT_KEYBOARD => 1

    /**
     * Mouse input.
     * @type {Integer (Int32)}
     */
    static IMDT_MOUSE => 2

    /**
     * Touch input.
     * @type {Integer (Int32)}
     */
    static IMDT_TOUCH => 4

    /**
     * Pen or stylus input.
     * @type {Integer (Int32)}
     */
    static IMDT_PEN => 8

    /**
     * Touchpad input (Windows 8.1 and later).
     * @type {Integer (Int32)}
     */
    static IMDT_TOUCHPAD => 16
}
