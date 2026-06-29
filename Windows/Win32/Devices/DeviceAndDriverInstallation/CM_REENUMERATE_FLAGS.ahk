#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_REENUMERATE_FLAGS {
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
    static CM_REENUMERATE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REENUMERATE_SYNCHRONOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REENUMERATE_RETRY_INSTALLATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REENUMERATE_ASYNCHRONOUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REENUMERATE_BITS => 7
}
