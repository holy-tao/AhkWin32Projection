#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_INSTALL_STATE {
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
    static CM_INSTALL_STATE_INSTALLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_INSTALL_STATE_NEEDS_REINSTALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_INSTALL_STATE_FAILED_INSTALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_INSTALL_STATE_FINISH_INSTALL => 3
}
