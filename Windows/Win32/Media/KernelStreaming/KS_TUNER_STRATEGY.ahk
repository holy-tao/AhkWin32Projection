#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_TUNER_STRATEGY {
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
    static KS_TUNER_STRATEGY_PLL => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_TUNER_STRATEGY_SIGNAL_STRENGTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_TUNER_STRATEGY_DRIVER_TUNES => 4
}
