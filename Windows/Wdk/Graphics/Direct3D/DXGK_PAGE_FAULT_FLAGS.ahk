#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_PAGE_FAULT_FLAGS {
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
    static DXGK_PAGE_FAULT_WRITE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_PAGE_FAULT_FENCE_INVALID => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_PAGE_FAULT_ADAPTER_RESET_REQUIRED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_PAGE_FAULT_ENGINE_RESET_REQUIRED => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_PAGE_FAULT_FATAL_HARDWARE_ERROR => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_PAGE_FAULT_IOMMU => 32

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_PAGE_FAULT_HW_CONTEXT_VALID => 64

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_PAGE_FAULT_PROCESS_HANDLE_VALID => 128
}
