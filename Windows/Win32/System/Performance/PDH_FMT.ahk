#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_FMT {
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
    static PDH_FMT_DOUBLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FMT_LARGE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FMT_LONG => 256
}
