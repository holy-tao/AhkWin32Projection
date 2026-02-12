#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies a compression algorithm to use when creating an instance of a compressor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.compressalgorithm
 * @namespace Windows.Storage.Compression
 * @version WindowsRuntime 1.4
 */
class CompressAlgorithm extends Win32Enum{

    /**
     * This value represents an invalid compression algorithm. It is useful primarily for error checking.
     * @type {Integer (Int32)}
     */
    static InvalidAlgorithm => 0

    /**
     * This value represents an algorithm that passes data through with no compression. It is useful primarily for testing.
     * @type {Integer (Int32)}
     */
    static NullAlgorithm => 1

    /**
     * The compressor will use the MSZIP compression algorithm.
     * @type {Integer (Int32)}
     */
    static Mszip => 2

    /**
     * The compressor will use the XPRESS compression algorithm.
     * @type {Integer (Int32)}
     */
    static Xpress => 3

    /**
     * The compressor will use the XPRESS compression algorithm with Huffman encoding.
     * @type {Integer (Int32)}
     */
    static XpressHuff => 4

    /**
     * The compressor will use the LZMS compression algorithm.
     * @type {Integer (Int32)}
     */
    static Lzms => 5
}
