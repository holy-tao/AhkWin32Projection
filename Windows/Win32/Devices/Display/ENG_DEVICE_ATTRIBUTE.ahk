#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct ENG_DEVICE_ATTRIBUTE {
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
    static QDA_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static QDA_ACCELERATION_LEVEL => 1
}
