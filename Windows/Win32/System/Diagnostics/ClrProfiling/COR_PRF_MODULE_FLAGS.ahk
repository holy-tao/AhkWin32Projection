#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_MODULE_FLAGS extends Win32Enum {

    /**
     * Native name: COR_PRF_MODULE_DISK
     * @type {Integer (Int32)}
     */
    static DISK => 1

    /**
     * Native name: COR_PRF_MODULE_NGEN
     * @type {Integer (Int32)}
     */
    static NGEN => 2

    /**
     * Native name: COR_PRF_MODULE_DYNAMIC
     * @type {Integer (Int32)}
     */
    static DYNAMIC => 4

    /**
     * Native name: COR_PRF_MODULE_COLLECTIBLE
     * @type {Integer (Int32)}
     */
    static COLLECTIBLE => 8

    /**
     * Native name: COR_PRF_MODULE_RESOURCE
     * @type {Integer (Int32)}
     */
    static RESOURCE => 16

    /**
     * Native name: COR_PRF_MODULE_FLAT_LAYOUT
     * @type {Integer (Int32)}
     */
    static FLAT_LAYOUT => 32

    /**
     * Native name: COR_PRF_MODULE_WINDOWS_RUNTIME
     * @type {Integer (Int32)}
     */
    static WINDOWS_RUNTIME => 64
}
