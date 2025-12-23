#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_MODULE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_DISK => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_NGEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_DYNAMIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_COLLECTIBLE => 8

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_RESOURCE => 16

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_FLAT_LAYOUT => 32

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_MODULE_WINDOWS_RUNTIME => 64
}
