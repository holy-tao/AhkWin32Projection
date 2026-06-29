#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ZONED_DEVICE_TYPES {
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
    static ZonedDeviceTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ZonedDeviceTypeHostManaged => 1

    /**
     * @type {Integer (Int32)}
     */
    static ZonedDeviceTypeHostAware => 2

    /**
     * @type {Integer (Int32)}
     */
    static ZonedDeviceTypeDeviceManaged => 3
}
