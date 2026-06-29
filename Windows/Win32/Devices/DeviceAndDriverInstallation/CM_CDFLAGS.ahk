#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_CDFLAGS {
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
    static CM_CDFLAGS_DRIVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDFLAGS_ROOT_OWNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDFLAGS_RESERVED => 4
}
