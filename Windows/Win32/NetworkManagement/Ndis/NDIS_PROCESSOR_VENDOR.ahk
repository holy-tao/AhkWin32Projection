#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_PROCESSOR_VENDOR {
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
    static NdisProcessorVendorUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorVendorGenuinIntel => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorVendorGenuineIntel => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorVendorAuthenticAMD => 2
}
