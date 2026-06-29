#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_MPEG2Level {
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
    static KS_MPEG2Level_Low => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Level_Main => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Level_High1440 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Level_High => 3
}
