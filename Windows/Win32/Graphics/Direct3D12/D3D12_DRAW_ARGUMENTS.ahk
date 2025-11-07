#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes parameters for drawing instances.
 * @remarks
 * 
 * The members of this structure serve the same purpose as the parameters of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-drawinstanced">DrawInstanced</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_draw_arguments
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DRAW_ARGUMENTS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the number of vertices to draw, per instance.
     * @type {Integer}
     */
    VertexCountPerInstance {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number of instances.
     * @type {Integer}
     */
    InstanceCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies an index to the first vertex to start drawing from.
     * @type {Integer}
     */
    StartVertexLocation {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies an index to the first instance to start drawing from.
     * @type {Integer}
     */
    StartInstanceLocation {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
