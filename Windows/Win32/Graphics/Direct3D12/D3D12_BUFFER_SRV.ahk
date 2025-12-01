#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the elements in a buffer resource to use in a shader-resource view.
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc">D3D12_SHADER_RESOURCE_VIEW_DESC</a> to create a view of a buffer. 
 * 
 * If the value of *StructureByteStride* is not 0, then a view of a structured buffer is created, and then the *D3D12_SHADER_RESOURCE_VIEW_DESC::Format* field must be **DXGI_FORMAT_UNKNOWN**. If *StructureByteStride* is 0, then a typed view of a buffer is created, and then a format must be supplied. The specified format for the typed view must be supported by the hardware.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_srv
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BUFFER_SRV extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The index of the first element to be accessed by the view.
     * @type {Integer}
     */
    FirstElement {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of elements in the resource.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_buffer_srv_flags">D3D12_BUFFER_SRV_FLAGS</a>-typed value that identifies view options for the buffer. Currently, the only option is to identify a raw view of the buffer. For more info about raw viewing of buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Raw Views of Buffers</a>.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
