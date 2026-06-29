#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes parameters for drawing indexed instances.
 * @remarks
 * The members of this structure serve the same purpose as the parameters of
 *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-drawindexedinstanced">DrawIndexedInstanced</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_draw_indexed_arguments
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRAW_INDEXED_ARGUMENTS {
    #StructPack 4

    /**
     * The number of indices read from the index buffer for each instance.
     */
    IndexCountPerInstance : UInt32

    /**
     * The number of instances to draw.
     */
    InstanceCount : UInt32

    /**
     * The location of the first index read by the GPU from the index buffer.
     */
    StartIndexLocation : UInt32

    /**
     * A value added to each index before reading a vertex from the vertex buffer.
     */
    BaseVertexLocation : Int32

    /**
     * A value added to each index before reading per-instance data from a vertex buffer.
     */
    StartInstanceLocation : UInt32

}
