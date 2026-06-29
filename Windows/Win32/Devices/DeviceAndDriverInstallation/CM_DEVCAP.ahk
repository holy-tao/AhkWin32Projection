#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_DEVCAP {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
