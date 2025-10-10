#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the purpose of a query heap. A query heap contains an array of individual queries.
 * @remarks
 * 
  * Use this structure with <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createqueryheap">CreateQueryHeap</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_query_heap_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_QUERY_HEAP_DESC extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies one member of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_query_heap_type">D3D12_QUERY_HEAP_TYPE</a>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the number of queries the heap should contain.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the  device's physical adapter) to which the query heap applies.
     *             Each bit in the mask corresponds to a single node.
     *             Only 1 bit must be set.
     *           Refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
