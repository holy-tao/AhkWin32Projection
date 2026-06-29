#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_WBPRESET {
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
    static KSCAMERA_EXTENDEDPROP_WBPRESET_CLOUDY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_WBPRESET_DAYLIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_WBPRESET_FLASH => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_WBPRESET_FLUORESCENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_WBPRESET_TUNGSTEN => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_WBPRESET_CANDLELIGHT => 6
}
