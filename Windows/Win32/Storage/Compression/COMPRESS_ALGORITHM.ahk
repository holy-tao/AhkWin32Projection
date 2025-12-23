#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Compression
 * @version v4.0.30319
 */
class COMPRESS_ALGORITHM extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_MSZIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_XPRESS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_XPRESS_HUFF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESS_ALGORITHM_LZMS => 5
}
