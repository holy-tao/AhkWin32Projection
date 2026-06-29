#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Arguments for draw instanced indirect.
 * @remarks
 * The members of this structure serve the same purpose as the parameters of
 *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawinstanced">ID3D11DeviceContext::DrawInstanced</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_draw_instanced_indirect_args
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_DRAW_INSTANCED_INDIRECT_ARGS {
    #StructPack 4

    /**
     * The number of vertices to draw.
     */
    VertexCountPerInstance : UInt32

    /**
     * The number of instances to draw.
     */
    InstanceCount : UInt32

    /**
     * The index of the first vertex.
     */
    StartVertexLocation : UInt32

    /**
     * A value added to each index before reading per-instance data from a vertex buffer.
     */
    StartInstanceLocation : UInt32

}
