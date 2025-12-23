#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes parameters for drawing indexed instances.
 * @remarks
 * The members of this structure serve the same purpose as the parameters of
 *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-drawindexedinstanced">DrawIndexedInstanced</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_draw_indexed_arguments
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DRAW_INDEXED_ARGUMENTS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The number of indices read from the index buffer for each instance.
     * @type {Integer}
     */
    IndexCountPerInstance {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of instances to draw.
     * @type {Integer}
     */
    InstanceCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The location of the first index read by the GPU from the index buffer.
     * @type {Integer}
     */
    StartIndexLocation {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A value added to each index before reading a vertex from the vertex buffer.
     * @type {Integer}
     */
    BaseVertexLocation {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A value added to each index before reading per-instance data from a vertex buffer.
     * @type {Integer}
     */
    StartInstanceLocation {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
