#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes query data for stream output.
 * @remarks
 * Use this structure with [D3D12_QUERY_HEAP_TYPE](/windows/win32/api/d3d12/ne-d3d12-d3d12_query_heap_type) and [CreateQueryHeap](/windows/win32/api/d3d12/nf-d3d12-id3d12device-createqueryheap).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_query_data_so_statistics
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_QUERY_DATA_SO_STATISTICS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of primitives (that is, points, lines, and triangles) that were actually written to the stream output resource.
     * @type {Integer}
     */
    NumPrimitivesWritten {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * If the stream output resource is large enough, then *PrimitivesStorageNeeded* represents the total number of primitives written to the stream output resource. Otherwise, it represents the total number of primitives that *would* have been written to the stream-output resource had there been enough space for them all.
     * @type {Integer}
     */
    PrimitivesStorageNeeded {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
