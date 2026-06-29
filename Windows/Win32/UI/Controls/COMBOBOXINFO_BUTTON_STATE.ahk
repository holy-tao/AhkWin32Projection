#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct COMBOBOXINFO_BUTTON_STATE {
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
    static STATE_SYSTEM_INVISIBLE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_PRESSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_FOCUSABLE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_OFFSCREEN => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_UNAVAILABLE => 1
}
