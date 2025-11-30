#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_LOG_CONF extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static BASIC_LOG_CONF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILTERED_LOG_CONF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOC_LOG_CONF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BOOT_LOG_CONF => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FORCED_LOG_CONF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OVERRIDE_LOG_CONF => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_LOG_CONF => 6
}
