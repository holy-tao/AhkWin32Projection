#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_DEVCAP{

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_LOCKSUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_EJECTSUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_REMOVABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_DOCKDEVICE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_UNIQUEID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_SILENTINSTALL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_RAWDEVICEOK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_SURPRISEREMOVALOK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_HARDWAREDISABLED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_NONDYNAMIC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CM_DEVCAP_SECUREDEVICE => 1024
}
