#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a vertex buffer view.
 * @remarks
 * Use this structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-iasetvertexbuffers">IASetVertexBuffers</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_vertex_buffer_view
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_VERTEX_BUFFER_VIEW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies a D3D12_GPU_VIRTUAL_ADDRESS that identifies the address of the buffer.
     * @type {Integer}
     */
    BufferLocation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the size in bytes of the buffer.
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the size in bytes of each vertex entry.
     * @type {Integer}
     */
    StrideInBytes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
