#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_HEAP_PROPERTIES.ahk

/**
 * Describes a heap.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createheap">CreateHeap</a> method, and returned by the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/id3d12heap-getdesc">GetDesc</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_heap_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_HEAP_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size, in bytes, of the heap.
     *             To avoid wasting memory, applications should pass <i>SizeInBytes</i> values which are multiples of the effective <i>Alignment</i>;
     *             but non-aligned <i>SizeInBytes</i> is also supported, for convenience.
     *             To find out how large a heap must be to support textures with undefined layouts and adapter-specific sizes, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getresourceallocationinfo">ID3D12Device::GetResourceAllocationInfo</a>.
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a> structure that describes the heap properties.
     * @type {D3D12_HEAP_PROPERTIES}
     */
    Properties{
        get {
            if(!this.HasProp("__Properties"))
                this.__Properties := D3D12_HEAP_PROPERTIES(8, this)
            return this.__Properties
        }
    }

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
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_heap_flags">D3D12_HEAP_FLAGS</a>-typed values that are combined by using a bitwise-OR operation.
     *             The resulting value identifies heap options.
     *             When creating heaps to support adapters with resource heap tier 1, an application must choose some flags.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
