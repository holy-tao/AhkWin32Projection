#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_CDMASK {
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
    static CM_CDMASK_DEVINST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDMASK_RESDES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDMASK_FLAGS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDMASK_DESCRIPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDMASK_VALID => 15
}
