#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_START_TYPE extends Win32Enum {

    /**
     * Native name: SERVICE_AUTO_START
     * @type {Integer (UInt32)}
     */
    static AUTO_START => 2

    /**
     * Native name: SERVICE_BOOT_START
     * @type {Integer (UInt32)}
     */
    static BOOT_START => 0

    /**
     * Native name: SERVICE_DEMAND_START
     * @type {Integer (UInt32)}
     */
    static DEMAND_START => 3

    /**
     * Native name: SERVICE_DISABLED
     * @type {Integer (UInt32)}
     */
    static DISABLED => 4

    /**
     * Native name: SERVICE_SYSTEM_START
     * @type {Integer (UInt32)}
     */
    static SYSTEM_START => 1
}
