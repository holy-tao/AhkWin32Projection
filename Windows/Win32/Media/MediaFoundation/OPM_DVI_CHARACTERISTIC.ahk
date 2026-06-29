#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_DVI_CHARACTERISTIC {
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
    static OPM_DVI_CHARACTERISTIC_1_0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static OPM_DVI_CHARACTERISTIC_1_1_OR_ABOVE => 2
}
