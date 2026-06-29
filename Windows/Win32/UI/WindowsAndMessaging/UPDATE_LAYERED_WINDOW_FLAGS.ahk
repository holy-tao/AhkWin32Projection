#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct UPDATE_LAYERED_WINDOW_FLAGS {
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
    static ULW_ALPHA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ULW_COLORKEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ULW_OPAQUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ULW_EX_NORESIZE => 8
}
