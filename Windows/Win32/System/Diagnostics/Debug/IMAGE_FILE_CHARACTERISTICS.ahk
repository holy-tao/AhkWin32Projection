#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGE_FILE_CHARACTERISTICS extends Win32BitflagEnum {

    /**
     * Native name: IMAGE_FILE_RELOCS_STRIPPED
     * @type {Integer (UInt16)}
     */
    static RELOCS_STRIPPED => 1

    /**
     * Native name: IMAGE_FILE_EXECUTABLE_IMAGE
     * @type {Integer (UInt16)}
     */
    static EXECUTABLE_IMAGE => 2

    /**
     * Native name: IMAGE_FILE_LINE_NUMS_STRIPPED
     * @type {Integer (UInt16)}
     */
    static LINE_NUMS_STRIPPED => 4

    /**
     * Native name: IMAGE_FILE_LOCAL_SYMS_STRIPPED
     * @type {Integer (UInt16)}
     */
    static LOCAL_SYMS_STRIPPED => 8

    /**
     * Native name: IMAGE_FILE_AGGRESIVE_WS_TRIM
     * @type {Integer (UInt16)}
     */
    static AGGRESIVE_WS_TRIM => 16

    /**
     * Native name: IMAGE_FILE_LARGE_ADDRESS_AWARE
     * @type {Integer (UInt16)}
     */
    static LARGE_ADDRESS_AWARE => 32

    /**
     * Native name: IMAGE_FILE_BYTES_REVERSED_LO
     * @type {Integer (UInt16)}
     */
    static BYTES_REVERSED_LO => 128

    /**
     * Native name: IMAGE_FILE_32BIT_MACHINE
     * @type {Integer (UInt16)}
     */
    static 32BIT_MACHINE => 256

    /**
     * Native name: IMAGE_FILE_DEBUG_STRIPPED
     * @type {Integer (UInt16)}
     */
    static DEBUG_STRIPPED => 512

    /**
     * Native name: IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP
     * @type {Integer (UInt16)}
     */
    static REMOVABLE_RUN_FROM_SWAP => 1024

    /**
     * Native name: IMAGE_FILE_NET_RUN_FROM_SWAP
     * @type {Integer (UInt16)}
     */
    static NET_RUN_FROM_SWAP => 2048

    /**
     * Native name: IMAGE_FILE_SYSTEM
     * @type {Integer (UInt16)}
     */
    static SYSTEM => 4096

    /**
     * Native name: IMAGE_FILE_DLL
     * @type {Integer (UInt16)}
     */
    static DLL => 8192

    /**
     * Native name: IMAGE_FILE_UP_SYSTEM_ONLY
     * @type {Integer (UInt16)}
     */
    static UP_SYSTEM_ONLY => 16384

    /**
     * Native name: IMAGE_FILE_BYTES_REVERSED_HI
     * @type {Integer (UInt16)}
     */
    static BYTES_REVERSED_HI => 32768
}
