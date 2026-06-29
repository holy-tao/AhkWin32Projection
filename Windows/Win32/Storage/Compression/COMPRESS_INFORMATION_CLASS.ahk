#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of this enumeration identify the type of information class being set or retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/compressapi/ne-compressapi-compress_information_class
 * @namespace Windows.Win32.Storage.Compression
 */
export default struct COMPRESS_INFORMATION_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Invalid information class
     * @type {Integer (Int32)}
     */
    static COMPRESS_INFORMATION_CLASS_INVALID => 0

    /**
     * Customized block size. The value specified may be from 65536 to 67108864 bytes. This value can be used only with the LZMS compression algorithm. A minimum size of 1 MB is suggested to get a better compression ratio. An information class of this type is sizeof(DWORD).
     * @type {Integer (Int32)}
     */
    static COMPRESS_INFORMATION_CLASS_BLOCK_SIZE => 1

    /**
     * Desired level of compression. The default value is <b>(DWORD)0</b>. The value <b>(DWORD)1</b> can improve the compression ratio with a slightly slower compression speed. This value can be used only with the XPRESS compression algorithm or the XPRESS with Huffman encoding compression algorithm. An information class of this type is sizeof(DWORD).
     * @type {Integer (Int32)}
     */
    static COMPRESS_INFORMATION_CLASS_LEVEL => 2
}
