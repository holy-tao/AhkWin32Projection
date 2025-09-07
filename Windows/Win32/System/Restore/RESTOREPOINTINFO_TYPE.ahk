#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Restore
 * @version v4.0.30319
 */
class RESTOREPOINTINFO_TYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static APPLICATION_INSTALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APPLICATION_UNINSTALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DRIVER_INSTALL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MODIFY_SETTINGS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CANCELLED_OPERATION => 13
}
