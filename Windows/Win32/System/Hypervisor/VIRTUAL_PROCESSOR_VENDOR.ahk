#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct VIRTUAL_PROCESSOR_VENDOR {
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
    static ProcessorVendor_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorVendor_Amd => 1

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorVendor_Intel => 2

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorVendor_Hygon => 3

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorVendor_Arm => 4
}
