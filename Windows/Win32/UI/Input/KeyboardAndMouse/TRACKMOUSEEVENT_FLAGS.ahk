#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct TRACKMOUSEEVENT_FLAGS {
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
    static TME_CANCEL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static TME_HOVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TME_LEAVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TME_NONCLIENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TME_QUERY => 1073741824
}
