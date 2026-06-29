#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HEADER_CONTROL_NOTIFICATION_BUTTON {
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
    static HEADER_CONTROL_NOTIFICATION_BUTTON_LEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HEADER_CONTROL_NOTIFICATION_BUTTON_RIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static HEADER_CONTROL_NOTIFICATION_BUTTON_MIDDLE => 2
}
