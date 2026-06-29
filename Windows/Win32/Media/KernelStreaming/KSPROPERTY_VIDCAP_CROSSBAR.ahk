#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDCAP_CROSSBAR {
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
    static KSPROPERTY_CROSSBAR_CAPS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CROSSBAR_PININFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CROSSBAR_CAN_ROUTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CROSSBAR_ROUTE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CROSSBAR_INPUT_ACTIVE => 4
}
