#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSMETHOD_WAVETABLE {
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
    static KSMETHOD_WAVETABLE_WAVE_ALLOC => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_WAVETABLE_WAVE_FREE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_WAVETABLE_WAVE_FIND => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_WAVETABLE_WAVE_WRITE => 3
}
