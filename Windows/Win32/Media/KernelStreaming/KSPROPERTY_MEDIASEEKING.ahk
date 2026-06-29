#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_MEDIASEEKING {
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
    static KSPROPERTY_MEDIASEEKING_CAPABILITIES => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_FORMATS => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_TIMEFORMAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_POSITION => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_STOPPOSITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_POSITIONS => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_DURATION => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_AVAILABLE => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_PREROLL => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MEDIASEEKING_CONVERTTIMEFORMAT => 9
}
