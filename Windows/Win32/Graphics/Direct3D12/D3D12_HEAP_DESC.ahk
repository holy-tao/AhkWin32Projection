#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_CPU_PAGE_PROPERTY.ahk" { D3D12_CPU_PAGE_PROPERTY }
#Import ".\D3D12_HEAP_TYPE.ahk" { D3D12_HEAP_TYPE }
#Import ".\D3D12_HEAP_FLAGS.ahk" { D3D12_HEAP_FLAGS }
#Import ".\D3D12_MEMORY_POOL.ahk" { D3D12_MEMORY_POOL }
#Import ".\D3D12_HEAP_PROPERTIES.ahk" { D3D12_HEAP_PROPERTIES }

/**
 * Describes a heap.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createheap">CreateHeap</a> method, and returned by the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/id3d12heap-getdesc">GetDesc</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_heap_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_HEAP_DESC {
    #StructPack 8

    /**
     * The size, in bytes, of the heap.
     *             To avoid wasting memory, applications should pass <i>SizeInBytes</i> values which are multiples of the effective <i>Alignment</i>;
     *             but non-aligned <i>SizeInBytes</i> is also supported, for convenience.
     *             To find out how large a heap must be to support textures with undefined layouts and adapter-specific sizes, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getresourceallocationinfo">ID3D12Device::GetResourceAllocationInfo</a>.
     */
    SizeInBytes : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a> structure that describes the heap properties.
     */
    Properties : D3D12_HEAP_PROPERTIES

    /**
     * The alignment value for the heap.  Valid values:
     *             
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0
     *                 </td>
     * <td>An alias for 64KB.
     *                 </td>
     * </tr>
     * <tr>
     * <td>D3D12_DEFAULT_RESOURCE_PLACEMENT_ALIGNMENT
     *                 </td>
     * <td>#defined as 64KB.
     *                 </td>
     * </tr>
     * <tr>
     * <td>D3D12_DEFAULT_MSAA_RESOURCE_PLACEMENT_ALIGNMENT
     *                 </td>
     * <td>#defined as 4MB.
     *                   An application must decide whether the heap will contain multi-sample anti-aliasing (MSAA), in which case, the application must choose D3D12_DEFAULT_MSAA_RESOURCE_PLACEMENT_ALIGNMENT.
     *                 </td>
     * </tr>
     * </table>
     */
    Alignment : Int64

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_heap_flags">D3D12_HEAP_FLAGS</a>-typed values that are combined by using a bitwise-OR operation.
     *             The resulting value identifies heap options.
     *             When creating heaps to support adapters with resource heap tier 1, an application must choose some flags.
     */
    Flags : D3D12_HEAP_FLAGS

}
