#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct LAYERED_WINDOW_ATTRIBUTES_FLAGS {
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
    static LWA_ALPHA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LWA_COLORKEY => 1
}
