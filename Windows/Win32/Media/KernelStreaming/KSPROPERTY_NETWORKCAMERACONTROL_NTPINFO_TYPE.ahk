#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE {
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
    static KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_DISABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_HOSTNTP => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_CUSTOM => 2
}
