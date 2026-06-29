#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SCROLLINFO_MASK {
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
    static SIF_ALL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SIF_DISABLENOSCROLL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SIF_PAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SIF_POS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SIF_RANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIF_TRACKPOS => 16
}
