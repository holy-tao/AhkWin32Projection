#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDEVICE_THERMAL_STATE {
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
    static KSDEVICE_THERMAL_STATE_LOW => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSDEVICE_THERMAL_STATE_HIGH => 1
}
