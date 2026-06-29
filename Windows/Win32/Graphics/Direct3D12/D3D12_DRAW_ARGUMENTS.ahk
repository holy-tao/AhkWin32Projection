#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes parameters for drawing instances.
 * @remarks
 * The members of this structure serve the same purpose as the parameters of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-drawinstanced">DrawInstanced</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_draw_arguments
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRAW_ARGUMENTS {
    #StructPack 4

    /**
     * Specifies the number of vertices to draw, per instance.
     */
    VertexCountPerInstance : UInt32

    /**
     * Specifies the number of instances.
     */
    InstanceCount : UInt32

    /**
     * Specifies an index to the first vertex to start drawing from.
     */
    StartVertexLocation : UInt32

    /**
     * Specifies an index to the first instance to start drawing from.
     */
    StartInstanceLocation : UInt32

}
