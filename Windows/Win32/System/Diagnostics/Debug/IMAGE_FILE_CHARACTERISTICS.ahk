#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_FILE_CHARACTERISTICS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_RELOCS_STRIPPED => 1

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_EXECUTABLE_IMAGE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_LINE_NUMS_STRIPPED => 4

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_LOCAL_SYMS_STRIPPED => 8

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_AGGRESIVE_WS_TRIM => 16

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_LARGE_ADDRESS_AWARE => 32

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_BYTES_REVERSED_LO => 128

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_32BIT_MACHINE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_DEBUG_STRIPPED => 512

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_NET_RUN_FROM_SWAP => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_SYSTEM => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_DLL => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_UP_SYSTEM_ONLY => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_BYTES_REVERSED_HI => 32768
}
