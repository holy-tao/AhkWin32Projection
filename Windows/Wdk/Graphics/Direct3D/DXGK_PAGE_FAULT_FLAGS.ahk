#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_PAGE_FAULT_FLAGS extends Win32Enum {

    /**
     * Native name: DXGK_PAGE_FAULT_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 1

    /**
     * Native name: DXGK_PAGE_FAULT_FENCE_INVALID
     * @type {Integer (Int32)}
     */
    static FENCE_INVALID => 2

    /**
     * Native name: DXGK_PAGE_FAULT_ADAPTER_RESET_REQUIRED
     * @type {Integer (Int32)}
     */
    static ADAPTER_RESET_REQUIRED => 4

    /**
     * Native name: DXGK_PAGE_FAULT_ENGINE_RESET_REQUIRED
     * @type {Integer (Int32)}
     */
    static ENGINE_RESET_REQUIRED => 8

    /**
     * Native name: DXGK_PAGE_FAULT_FATAL_HARDWARE_ERROR
     * @type {Integer (Int32)}
     */
    static FATAL_HARDWARE_ERROR => 16

    /**
     * Native name: DXGK_PAGE_FAULT_IOMMU
     * @type {Integer (Int32)}
     */
    static IOMMU => 32

    /**
     * Native name: DXGK_PAGE_FAULT_HW_CONTEXT_VALID
     * @type {Integer (Int32)}
     */
    static HW_CONTEXT_VALID => 64

    /**
     * Native name: DXGK_PAGE_FAULT_PROCESS_HANDLE_VALID
     * @type {Integer (Int32)}
     */
    static PROCESS_HANDLE_VALID => 128
}
