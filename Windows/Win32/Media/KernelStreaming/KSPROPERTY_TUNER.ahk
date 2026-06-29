#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_TUNER {
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
    static KSPROPERTY_TUNER_CAPS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE_CAPS => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_MODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_STANDARD => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_FREQUENCY => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_INPUT => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_STATUS => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_IF_MEDIUM => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_SCAN_CAPS => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_SCAN_STATUS => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_STANDARD_MODE => 10

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_TUNER_NETWORKTYPE_SCAN_CAPS => 11
}
