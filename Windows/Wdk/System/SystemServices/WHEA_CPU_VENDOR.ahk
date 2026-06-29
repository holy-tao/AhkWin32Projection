#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_CPU_VENDOR {
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
    static WheaCpuVendorOther => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaCpuVendorIntel => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaCpuVendorAmd => 2
}
