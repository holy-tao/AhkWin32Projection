#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class _REFS_STREAM_EXTENT_PROPERTIES extends Win32Enum {

    /**
     * Native name: REFS_STREAM_EXTENT_PROPERTY_VALID
     * @type {Integer (Int32)}
     */
    static PROPERTY_VALID => 16

    /**
     * Native name: REFS_STREAM_EXTENT_PROPERTY_STREAM_RESERVED
     * @type {Integer (Int32)}
     */
    static PROPERTY_STREAM_RESERVED => 32

    /**
     * Native name: REFS_STREAM_EXTENT_PROPERTY_CRC32
     * @type {Integer (Int32)}
     */
    static PROPERTY_CRC32 => 128

    /**
     * Native name: REFS_STREAM_EXTENT_PROPERTY_CRC64
     * @type {Integer (Int32)}
     */
    static PROPERTY_CRC64 => 256

    /**
     * Native name: REFS_STREAM_EXTENT_PROPERTY_GHOSTED
     * @type {Integer (Int32)}
     */
    static PROPERTY_GHOSTED => 512

    /**
     * Native name: REFS_STREAM_EXTENT_PROPERTY_READONLY
     * @type {Integer (Int32)}
     */
    static PROPERTY_READONLY => 1024

    /**
     * Native name: REFS_STREAM_EXTENT_PROPERTY_SPARSE
     * @type {Integer (Int32)}
     */
    static PROPERTY_SPARSE => 8
}
