#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_TYPE {
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
    static Integrated => 0

    /**
     * @type {Integer (Int32)}
     */
    static External => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceHost => 2
}
