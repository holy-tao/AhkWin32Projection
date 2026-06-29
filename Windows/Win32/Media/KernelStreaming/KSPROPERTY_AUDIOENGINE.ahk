#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_AUDIOENGINE {
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
    static KSPROPERTY_AUDIOENGINE_LFXENABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOENGINE_GFXENABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOENGINE_MIXFORMAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOENGINE_DEVICEFORMAT => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOENGINE_SUPPORTEDDEVICEFORMATS => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOENGINE_DESCRIPTOR => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOENGINE_BUFFER_SIZE_RANGE => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOENGINE_LOOPBACK_PROTECTION => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOENGINE_VOLUMELEVEL => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOENGINE_DEVICECONTROLS => 10
}
