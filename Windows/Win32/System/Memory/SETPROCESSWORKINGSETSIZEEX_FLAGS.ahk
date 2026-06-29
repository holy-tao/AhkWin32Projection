#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct SETPROCESSWORKINGSETSIZEEX_FLAGS {
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
    static QUOTA_LIMITS_HARDWS_MIN_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QUOTA_LIMITS_HARDWS_MIN_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QUOTA_LIMITS_HARDWS_MAX_ENABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QUOTA_LIMITS_HARDWS_MAX_DISABLE => 8
}
