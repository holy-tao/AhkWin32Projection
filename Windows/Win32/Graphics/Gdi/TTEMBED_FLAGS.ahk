#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TTEMBED_FLAGS {
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
    static TTEMBED_EMBEDEUDC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_RAW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_SUBSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_TTCOMPRESSED => 4
}
