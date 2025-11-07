#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes query data for stream output.
 * @remarks
 * 
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_heap_type">D3D12_QUERY_HEAP_TYPE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createqueryheap">CreateQueryHeap</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_query_data_so_statistics
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_QUERY_DATA_SO_STATISTICS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of primitives written.
     * @type {Integer}
     */
    NumPrimitivesWritten {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total amount of storage needed by the primitives.
     * @type {Integer}
     */
    PrimitivesStorageNeeded {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
