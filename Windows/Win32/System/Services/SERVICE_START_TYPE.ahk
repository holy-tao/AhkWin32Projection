#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_START_TYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_AUTO_START => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_BOOT_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_DEMAND_START => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SYSTEM_START => 1
}
