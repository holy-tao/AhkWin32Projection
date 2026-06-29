#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a vertex buffer view.
 * @remarks
 * Use this structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-iasetvertexbuffers">IASetVertexBuffers</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_vertex_buffer_view
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_VERTEX_BUFFER_VIEW {
    #StructPack 8

    /**
     * Specifies a D3D12_GPU_VIRTUAL_ADDRESS that identifies the address of the buffer.
     */
    BufferLocation : Int64

    /**
     * Specifies the size in bytes of the buffer.
     */
    SizeInBytes : UInt32

    /**
     * Specifies the size in bytes of each vertex entry.
     */
    StrideInBytes : UInt32

}
