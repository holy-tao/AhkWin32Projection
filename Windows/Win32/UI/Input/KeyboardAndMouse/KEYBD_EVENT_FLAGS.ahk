#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct KEYBD_EVENT_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static KEYEVENTF_EXTENDEDKEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KEYEVENTF_KEYUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KEYEVENTF_SCANCODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KEYEVENTF_UNICODE => 4
}
