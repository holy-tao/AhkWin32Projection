#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_DEVCAP extends Win32BitflagEnum {

    /**
     * Native name: CM_DEVCAP_LOCKSUPPORTED
     * @type {Integer (UInt32)}
     */
    static LOCKSUPPORTED => 1

    /**
     * Native name: CM_DEVCAP_EJECTSUPPORTED
     * @type {Integer (UInt32)}
     */
    static EJECTSUPPORTED => 2

    /**
     * Native name: CM_DEVCAP_REMOVABLE
     * @type {Integer (UInt32)}
     */
    static REMOVABLE => 4

    /**
     * Native name: CM_DEVCAP_DOCKDEVICE
     * @type {Integer (UInt32)}
     */
    static DOCKDEVICE => 8

    /**
     * Native name: CM_DEVCAP_UNIQUEID
     * @type {Integer (UInt32)}
     */
    static UNIQUEID => 16

    /**
     * Native name: CM_DEVCAP_SILENTINSTALL
     * @type {Integer (UInt32)}
     */
    static SILENTINSTALL => 32

    /**
     * Native name: CM_DEVCAP_RAWDEVICEOK
     * @type {Integer (UInt32)}
     */
    static RAWDEVICEOK => 64

    /**
     * Native name: CM_DEVCAP_SURPRISEREMOVALOK
     * @type {Integer (UInt32)}
     */
    static SURPRISEREMOVALOK => 128

    /**
     * Native name: CM_DEVCAP_HARDWAREDISABLED
     * @type {Integer (UInt32)}
     */
    static HARDWAREDISABLED => 256

    /**
     * Native name: CM_DEVCAP_NONDYNAMIC
     * @type {Integer (UInt32)}
     */
    static NONDYNAMIC => 512

    /**
     * Native name: CM_DEVCAP_SECUREDEVICE
     * @type {Integer (UInt32)}
     */
    static SECUREDEVICE => 1024
}
