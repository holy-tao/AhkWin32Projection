#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct FRAMING_CACHE_OPS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static Framing_Cache_Update => 0

    /**
     * @type {Integer (Int32)}
     */
    static Framing_Cache_ReadLast => 1

    /**
     * @type {Integer (Int32)}
     */
    static Framing_Cache_ReadOrig => 2

    /**
     * @type {Integer (Int32)}
     */
    static Framing_Cache_Write => 3
}
