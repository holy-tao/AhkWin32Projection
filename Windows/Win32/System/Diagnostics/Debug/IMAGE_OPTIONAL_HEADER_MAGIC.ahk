#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_OPTIONAL_HEADER_MAGIC {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_NT_OPTIONAL_HDR_MAGIC => 523

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_NT_OPTIONAL_HDR32_MAGIC => 267

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_NT_OPTIONAL_HDR64_MAGIC => 523

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_ROM_OPTIONAL_HDR_MAGIC => 263
}
