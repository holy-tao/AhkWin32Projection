#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HDV_DEVICE_TYPE
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvDeviceType
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_DEVICE_TYPE {
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
    static HdvDeviceTypeUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static HdvDeviceTypePCI => 1
}
