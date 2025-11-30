#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class _REFS_STREAM_EXTENT_PROPERTIES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_VALID => 16

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_STREAM_RESERVED => 32

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_CRC32 => 128

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_CRC64 => 256

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_GHOSTED => 512

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_READONLY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_EXTENT_PROPERTY_SPARSE => 8
}
