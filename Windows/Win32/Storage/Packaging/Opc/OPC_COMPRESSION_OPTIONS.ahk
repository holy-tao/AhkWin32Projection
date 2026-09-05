#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes ways to compress part content.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_compression_options
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
class OPC_COMPRESSION_OPTIONS extends Win32Enum {

    /**
     * Compression is turned off.
     * Native name: OPC_COMPRESSION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => -1

    /**
     * Compression is optimized for a balance between size and performance.
     * Native name: OPC_COMPRESSION_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Compression is optimized for size.
     * Native name: OPC_COMPRESSION_MAXIMUM
     * @type {Integer (Int32)}
     */
    static MAXIMUM => 1

    /**
     * Compression is optimized for performance.
     * Native name: OPC_COMPRESSION_FAST
     * @type {Integer (Int32)}
     */
    static FAST => 2

    /**
     * Compression is optimized for high performance.
     * Native name: OPC_COMPRESSION_SUPERFAST
     * @type {Integer (Int32)}
     */
    static SUPERFAST => 3
}
