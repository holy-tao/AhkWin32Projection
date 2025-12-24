#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class REFS_COMPRESSION_FORMATS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static REFS_COMPRESSION_FORMAT_UNCOMPRESSED => 0

    /**
     * @type {Integer (Int32)}
     */
    static REFS_COMPRESSION_FORMAT_LZ4 => 1

    /**
     * @type {Integer (Int32)}
     */
    static REFS_COMPRESSION_FORMAT_ZSTD => 2

    /**
     * @type {Integer (Int32)}
     */
    static REFS_COMPRESSION_FORMAT_MAX => 3
}
