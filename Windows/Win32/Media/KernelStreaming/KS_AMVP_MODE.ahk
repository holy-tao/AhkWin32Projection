#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_AMVP_MODE {
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
    static KS_AMVP_MODE_WEAVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_MODE_BOBINTERLEAVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_MODE_BOBNONINTERLEAVED => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_MODE_SKIPEVEN => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_MODE_SKIPODD => 4
}
