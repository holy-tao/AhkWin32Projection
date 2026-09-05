#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class REFS_COMPRESSION_FORMATS extends Win32Enum {

    /**
     * Native name: REFS_COMPRESSION_FORMAT_UNCOMPRESSED
     * @type {Integer (Int32)}
     */
    static FORMAT_UNCOMPRESSED => 0

    /**
     * Native name: REFS_COMPRESSION_FORMAT_LZ4
     * @type {Integer (Int32)}
     */
    static FORMAT_LZ4 => 1

    /**
     * Native name: REFS_COMPRESSION_FORMAT_ZSTD
     * @type {Integer (Int32)}
     */
    static FORMAT_ZSTD => 2

    /**
     * Native name: REFS_COMPRESSION_FORMAT_MAX
     * @type {Integer (Int32)}
     */
    static FORMAT_MAX => 3
}
