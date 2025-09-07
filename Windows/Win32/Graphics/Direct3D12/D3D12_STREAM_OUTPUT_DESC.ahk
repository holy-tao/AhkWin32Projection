#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a streaming output buffer.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> object contains a <b>D3D12_STREAM_OUTPUT_DESC</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_stream_output_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_STREAM_OUTPUT_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_so_declaration_entry">D3D12_SO_DECLARATION_ENTRY</a> structures. Can't be <b>NULL</b> if <b>NumEntries</b> &gt; 0.
     * @type {Pointer<D3D12_SO_DECLARATION_ENTRY>}
     */
    pSODeclaration {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of entries in the stream output declaration array that the <b>pSODeclaration</b> member points to.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of buffer strides; each stride is the size of an element for that buffer.
     * @type {Pointer<UInt32>}
     */
    pBufferStrides {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of strides (or buffers) that the <b>pBufferStrides</b> member points to.
     * @type {Integer}
     */
    NumStrides {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The index number of the stream to be sent to the rasterizer stage.
     * @type {Integer}
     */
    RasterizedStream {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
