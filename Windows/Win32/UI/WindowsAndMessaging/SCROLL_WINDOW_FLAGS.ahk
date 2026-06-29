#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SCROLL_WINDOW_FLAGS {
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
    static SW_SCROLLCHILDREN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SW_INVALIDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SW_ERASE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SW_SMOOTHSCROLL => 16
}
