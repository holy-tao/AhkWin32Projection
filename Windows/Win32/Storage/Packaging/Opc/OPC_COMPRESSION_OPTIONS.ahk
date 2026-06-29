#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes ways to compress part content.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_compression_options
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct OPC_COMPRESSION_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Compression is turned off.
     * @type {Integer (Int32)}
     */
    static OPC_COMPRESSION_NONE => -1

    /**
     * Compression is optimized for a balance between size and performance.
     * @type {Integer (Int32)}
     */
    static OPC_COMPRESSION_NORMAL => 0

    /**
     * Compression is optimized for size.
     * @type {Integer (Int32)}
     */
    static OPC_COMPRESSION_MAXIMUM => 1

    /**
     * Compression is optimized for performance.
     * @type {Integer (Int32)}
     */
    static OPC_COMPRESSION_FAST => 2

    /**
     * Compression is optimized for high performance.
     * @type {Integer (Int32)}
     */
    static OPC_COMPRESSION_SUPERFAST => 3
}
