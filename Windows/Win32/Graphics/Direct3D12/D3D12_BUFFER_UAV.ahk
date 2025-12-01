#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the elements in a buffer to use in a unordered-access view. (D3D12_BUFFER_UAV)
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc">D3D12_UNORDERED_ACCESS_VIEW_DESC</a> structure to view the resource as a buffer.
 * 
 * If <i>StructureByteStride</i> value is not 0, a view of a structured buffer is created and the D3D12_UNORDERED_ACCESS_VIEW_DESC::Format field must be DXGI_FORMAT_UNKNOWN. If <i>StructureByteStride</i> is 0, a typed view of a buffer is created and a format must be supplied. The specified format for the typed view must be supported by the hardware. More information on this topic can be found in the <a href="https://docs.microsoft.com/en-gb/windows/win32/direct3d12/typed-unordered-access-view-loads">Typed unordered access view (UAV) loads</a> page.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_uav
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BUFFER_UAV extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The zero-based index of the first element to be accessed.
     * @type {Integer}
     */
    FirstElement {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of elements in the resource. For structured buffers, this is the number of structures in the buffer.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of each element in the buffer structure (in bytes) when the buffer represents a structured buffer.
     * @type {Integer}
     */
    StructureByteStride {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The counter offset, in bytes.
     * @type {Integer}
     */
    CounterOffsetInBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_buffer_uav_flags">D3D12_BUFFER_UAV_FLAGS</a>-typed value that specifies the view options for the resource.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
