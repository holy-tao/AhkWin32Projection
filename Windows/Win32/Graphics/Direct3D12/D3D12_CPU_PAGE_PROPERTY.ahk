#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the CPU-page properties for the heap.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_cpu_page_property
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_CPU_PAGE_PROPERTY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The CPU-page property is unknown.
     * @type {Integer (Int32)}
     */
    static D3D12_CPU_PAGE_PROPERTY_UNKNOWN => 0

    /**
     * The CPU cannot access the heap, therefore no page properties are available.
     * @type {Integer (Int32)}
     */
    static D3D12_CPU_PAGE_PROPERTY_NOT_AVAILABLE => 1

    /**
     * The CPU-page property is write-combined.
     * @type {Integer (Int32)}
     */
    static D3D12_CPU_PAGE_PROPERTY_WRITE_COMBINE => 2

    /**
     * The CPU-page property is write-back.
     * @type {Integer (Int32)}
     */
    static D3D12_CPU_PAGE_PROPERTY_WRITE_BACK => 3
}
