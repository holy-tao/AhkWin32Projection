#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_HRTF_FILTER_METHOD {
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
    static DIRECT_FORM => 0

    /**
     * @type {Integer (Int32)}
     */
    static CASCADE_FORM => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSDS3D_FILTER_METHOD_COUNT => 2
}
