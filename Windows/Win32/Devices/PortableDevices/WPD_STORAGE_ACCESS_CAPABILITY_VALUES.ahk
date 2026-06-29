#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_STORAGE_ACCESS_CAPABILITY_VALUES {
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
    static WPD_STORAGE_ACCESS_CAPABILITY_READWRITE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITHOUT_OBJECT_DELETION => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITH_OBJECT_DELETION => 2
}
