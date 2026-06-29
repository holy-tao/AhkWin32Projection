#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_VENDOR {
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
    static WHvProcessorVendorAmd => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorVendorIntel => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorVendorHygon => 2
}
