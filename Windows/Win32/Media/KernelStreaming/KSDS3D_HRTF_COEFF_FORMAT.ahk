#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_HRTF_COEFF_FORMAT {
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
    static FLOAT_COEFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static SHORT_COEFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSDS3D_COEFF_COUNT => 2
}
