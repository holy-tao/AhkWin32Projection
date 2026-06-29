#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EXpsCompressionOptions {
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
    static Compression_NotCompressed => 0

    /**
     * @type {Integer (Int32)}
     */
    static Compression_Normal => 1

    /**
     * @type {Integer (Int32)}
     */
    static Compression_Small => 2

    /**
     * @type {Integer (Int32)}
     */
    static Compression_Fast => 3
}
