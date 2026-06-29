#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_EXTXPORT {
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
    static KSPROPERTY_EXTXPORT_CAPABILITIES => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_INPUT_SIGNAL_MODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_OUTPUT_SIGNAL_MODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_LOAD_MEDIUM => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_MEDIUM_INFO => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_STATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_STATE_NOTIFY => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_TIMECODE_SEARCH => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_ATN_SEARCH => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_RTC_SEARCH => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RAW_AVC_CMD => 10
}
