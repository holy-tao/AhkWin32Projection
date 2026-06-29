#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_GET_DEVICE_INTERFACE_LIST_FLAGS {
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
    static CM_GET_DEVICE_INTERFACE_LIST_PRESENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_GET_DEVICE_INTERFACE_LIST_ALL_DEVICES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_GET_DEVICE_INTERFACE_LIST_BITS => 1
}
