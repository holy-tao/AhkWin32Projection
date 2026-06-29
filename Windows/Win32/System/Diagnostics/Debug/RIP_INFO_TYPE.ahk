#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct RIP_INFO_TYPE {
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
    static SLE_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SLE_MINORERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SLE_WARNING => 3
}
