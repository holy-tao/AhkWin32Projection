#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_FMRX_TOPOLOGY {
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
    static KSPROPERTY_FMRX_ENDPOINTID => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_FMRX_VOLUME => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_FMRX_ANTENNAENDPOINTID => 2
}
