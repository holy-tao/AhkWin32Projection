#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the CPU-page properties for the heap.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_cpu_page_property
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_CPU_PAGE_PROPERTY extends Win32Enum{

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
