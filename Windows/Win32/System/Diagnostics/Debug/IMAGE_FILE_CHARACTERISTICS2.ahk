#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGE_FILE_CHARACTERISTICS2 extends Win32BitflagEnum {

    /**
     * Native name: IMAGE_FILE_RELOCS_STRIPPED2
     * @type {Integer (UInt32)}
     */
    static RELOCS_STRIPPED2 => 1

    /**
     * Native name: IMAGE_FILE_EXECUTABLE_IMAGE2
     * @type {Integer (UInt32)}
     */
    static EXECUTABLE_IMAGE2 => 2

    /**
     * Native name: IMAGE_FILE_LINE_NUMS_STRIPPED2
     * @type {Integer (UInt32)}
     */
    static LINE_NUMS_STRIPPED2 => 4

    /**
     * Native name: IMAGE_FILE_LOCAL_SYMS_STRIPPED2
     * @type {Integer (UInt32)}
     */
    static LOCAL_SYMS_STRIPPED2 => 8

    /**
     * Native name: IMAGE_FILE_AGGRESIVE_WS_TRIM2
     * @type {Integer (UInt32)}
     */
    static AGGRESIVE_WS_TRIM2 => 16

    /**
     * Native name: IMAGE_FILE_LARGE_ADDRESS_AWARE2
     * @type {Integer (UInt32)}
     */
    static LARGE_ADDRESS_AWARE2 => 32

    /**
     * Native name: IMAGE_FILE_BYTES_REVERSED_LO2
     * @type {Integer (UInt32)}
     */
    static BYTES_REVERSED_LO2 => 128

    /**
     * Native name: IMAGE_FILE_32BIT_MACHINE2
     * @type {Integer (UInt32)}
     */
    static 32BIT_MACHINE2 => 256

    /**
     * Native name: IMAGE_FILE_DEBUG_STRIPPED2
     * @type {Integer (UInt32)}
     */
    static DEBUG_STRIPPED2 => 512

    /**
     * Native name: IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP2
     * @type {Integer (UInt32)}
     */
    static REMOVABLE_RUN_FROM_SWAP2 => 1024

    /**
     * Native name: IMAGE_FILE_NET_RUN_FROM_SWAP2
     * @type {Integer (UInt32)}
     */
    static NET_RUN_FROM_SWAP2 => 2048

    /**
     * Native name: IMAGE_FILE_SYSTEM_2
     * @type {Integer (UInt32)}
     */
    static SYSTEM_2 => 4096

    /**
     * Native name: IMAGE_FILE_DLL_2
     * @type {Integer (UInt32)}
     */
    static DLL_2 => 8192

    /**
     * Native name: IMAGE_FILE_UP_SYSTEM_ONLY_2
     * @type {Integer (UInt32)}
     */
    static UP_SYSTEM_ONLY_2 => 16384

    /**
     * Native name: IMAGE_FILE_BYTES_REVERSED_HI_2
     * @type {Integer (UInt32)}
     */
    static BYTES_REVERSED_HI_2 => 32768
}
