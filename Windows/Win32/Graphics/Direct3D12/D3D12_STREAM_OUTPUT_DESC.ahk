#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SO_DECLARATION_ENTRY.ahk" { D3D12_SO_DECLARATION_ENTRY }

/**
 * Describes a streaming output buffer.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> object contains a <b>D3D12_STREAM_OUTPUT_DESC</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_stream_output_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_STREAM_OUTPUT_DESC {
    #StructPack 8

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_so_declaration_entry">D3D12_SO_DECLARATION_ENTRY</a> structures. Can't be <b>NULL</b> if <b>NumEntries</b> &gt; 0.
     */
    pSODeclaration : D3D12_SO_DECLARATION_ENTRY.Ptr

    /**
     * The number of entries in the stream output declaration array that the <b>pSODeclaration</b> member points to.
     */
    NumEntries : UInt32

    /**
     * An array of buffer strides; each stride is the size of an element for that buffer.
     */
    pBufferStrides : IntPtr

    /**
     * The number of strides (or buffers) that the <b>pBufferStrides</b> member points to.
     */
    NumStrides : UInt32

    /**
     * The index number of the stream to be sent to the rasterizer stage.
     */
    RasterizedStream : UInt32

}
