#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDP_REPORT_TYPE {
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
    static HidP_Input => 0

    /**
     * @type {Integer (Int32)}
     */
    static HidP_Output => 1

    /**
     * @type {Integer (Int32)}
     */
    static HidP_Feature => 2
}
