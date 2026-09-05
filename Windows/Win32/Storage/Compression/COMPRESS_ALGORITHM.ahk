#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Compression
 */
class COMPRESS_ALGORITHM extends Win32Enum {

    /**
     * Native name: COMPRESS_ALGORITHM_MSZIP
     * @type {Integer (UInt32)}
     */
    static MSZIP => 2

    /**
     * Native name: COMPRESS_ALGORITHM_XPRESS
     * @type {Integer (UInt32)}
     */
    static XPRESS => 3

    /**
     * Native name: COMPRESS_ALGORITHM_XPRESS_HUFF
     * @type {Integer (UInt32)}
     */
    static XPRESS_HUFF => 4

    /**
     * Native name: COMPRESS_ALGORITHM_LZMS
     * @type {Integer (UInt32)}
     */
    static LZMS => 5
}
