#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_OUTPUT_HARDWARE_PROTECTION {
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
    static OPM_OUTPUT_HARDWARE_PROTECTION_NOT_SUPPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPM_OUTPUT_HARDWARE_PROTECTION_SUPPORTED => 1
}
