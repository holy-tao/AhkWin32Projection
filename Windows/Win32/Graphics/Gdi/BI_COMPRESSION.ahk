#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct BI_COMPRESSION {
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
    static BI_RGB => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BI_RLE8 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BI_RLE4 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BI_BITFIELDS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BI_JPEG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BI_PNG => 5
}
