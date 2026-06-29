#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TUNER_MODES {
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
    static KSPROPERTY_TUNER_MODE_TV => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_FM_RADIO => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_AM_RADIO => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_DSS => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_ATSC => 16
}
