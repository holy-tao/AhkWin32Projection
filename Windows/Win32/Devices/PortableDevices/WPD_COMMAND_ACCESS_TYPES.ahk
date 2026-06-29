#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_COMMAND_ACCESS_TYPES {
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
    static WPD_COMMAND_ACCESS_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COMMAND_ACCESS_READWRITE => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_STGM_ACCESS => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_FILE_ACCESS => 8

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COMMAND_ACCESS_FROM_ATTRIBUTE_WITH_METHOD_ACCESS => 16
}
