#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_AMVP_SELECTFORMATBY {
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
    static KS_AMVP_DO_NOT_CARE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_BEST_BANDWIDTH => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_INPUT_SAME_AS_OUTPUT => 2
}
