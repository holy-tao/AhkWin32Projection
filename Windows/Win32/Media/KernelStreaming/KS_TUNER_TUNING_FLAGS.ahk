#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_TUNER_TUNING_FLAGS {
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
    static KS_TUNER_TUNING_EXACT => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_TUNER_TUNING_FINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_TUNER_TUNING_COARSE => 3
}
