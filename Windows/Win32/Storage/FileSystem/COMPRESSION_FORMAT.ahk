#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class COMPRESSION_FORMAT extends Win32Enum {

    /**
     * Native name: COMPRESSION_FORMAT_NONE
     * @type {Integer (UInt16)}
     */
    static NONE => 0

    /**
     * Native name: COMPRESSION_FORMAT_DEFAULT
     * @type {Integer (UInt16)}
     */
    static DEFAULT => 1

    /**
     * Native name: COMPRESSION_FORMAT_LZNT1
     * @type {Integer (UInt16)}
     */
    static LZNT1 => 2

    /**
     * Native name: COMPRESSION_FORMAT_XPRESS
     * @type {Integer (UInt16)}
     */
    static XPRESS => 3

    /**
     * Native name: COMPRESSION_FORMAT_XPRESS_HUFF
     * @type {Integer (UInt16)}
     */
    static XPRESS_HUFF => 4

    /**
     * Native name: COMPRESSION_FORMAT_XP10
     * @type {Integer (UInt16)}
     */
    static XP10 => 5

    /**
     * Native name: COMPRESSION_FORMAT_LZ4
     * @type {Integer (UInt16)}
     */
    static LZ4 => 6

    /**
     * Native name: COMPRESSION_FORMAT_DEFLATE
     * @type {Integer (UInt16)}
     */
    static DEFLATE => 7

    /**
     * Native name: COMPRESSION_FORMAT_ZLIB
     * @type {Integer (UInt16)}
     */
    static ZLIB => 8
}
