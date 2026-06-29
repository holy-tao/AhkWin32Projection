#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct HOT_KEY_MODIFIERS {
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
    static MOD_ALT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_NOREPEAT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_SHIFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_WIN => 8
}
