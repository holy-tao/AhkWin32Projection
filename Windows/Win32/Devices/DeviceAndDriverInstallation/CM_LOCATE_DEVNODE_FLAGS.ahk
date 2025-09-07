#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_LOCATE_DEVNODE_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CM_LOCATE_DEVNODE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_LOCATE_DEVNODE_PHANTOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_LOCATE_DEVNODE_CANCELREMOVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_LOCATE_DEVNODE_NOVALIDATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_LOCATE_DEVNODE_BITS => 7
}
