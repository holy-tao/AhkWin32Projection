#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SOC_SUBSYSTEM_TYPE {
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
    static SOC_SUBSYS_WIRELESS_MODEM => 0

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_AUDIO_DSP => 1

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_WIRELSS_CONNECTIVITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_SENSORS => 3

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_COMPUTE_DSP => 4

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_SECURE_PROC => 5

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_VENDOR_DEFINED => 65536
}
