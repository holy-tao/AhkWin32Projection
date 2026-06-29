#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct ENABLE_SCROLL_BAR_ARROWS {
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
    static ESB_DISABLE_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ESB_DISABLE_DOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ESB_DISABLE_LEFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ESB_DISABLE_LTUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ESB_DISABLE_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ESB_DISABLE_RTDN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ESB_DISABLE_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ESB_ENABLE_BOTH => 0
}
