#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_WAVE {
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
    static KSPROPERTY_WAVE_COMPATIBLE_CAPABILITIES => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_WAVE_INPUT_CAPABILITIES => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_WAVE_OUTPUT_CAPABILITIES => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_WAVE_BUFFER => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_WAVE_FREQUENCY => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_WAVE_VOLUME => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_WAVE_PAN => 6
}
