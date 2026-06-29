#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_NOTIFY_FILTER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_FILTER_TYPE_DEVICEINTERFACE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_FILTER_TYPE_DEVICEINSTANCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_FILTER_TYPE_MAX => 3
}
