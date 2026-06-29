#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct ANIMATE_WINDOW_FLAGS {
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
    static AW_ACTIVATE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static AW_BLEND => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static AW_CENTER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AW_HIDE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static AW_HOR_POSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AW_HOR_NEGATIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AW_SLIDE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static AW_VER_POSITIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AW_VER_NEGATIVE => 8
}
