#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VBICODECFILTERING {
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
    static KSPROPERTY_VBICODECFILTERING_SCANLINES_REQUESTED_BIT_ARRAY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VBICODECFILTERING_SCANLINES_DISCOVERED_BIT_ARRAY => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_REQUESTED_BIT_ARRAY => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_DISCOVERED_BIT_ARRAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VBICODECFILTERING_STATISTICS => 5
}
