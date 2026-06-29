#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct PIPE_TYPE {
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
    static EVENT_PIPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static READ_DATA_PIPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WRITE_DATA_PIPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ALL_PIPE => 3
}
