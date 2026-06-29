#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a stream output buffer.
 * @remarks
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-sosettargets">SOSetTargets</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_stream_output_buffer_view
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_STREAM_OUTPUT_BUFFER_VIEW {
    #StructPack 8

    /**
     * A D3D12_GPU_VIRTUAL_ADDRESS (a UINT64) that points to the stream output buffer.
     *             If <b>SizeInBytes</b> is 0, this member isn't used and can be any value.
     */
    BufferLocation : Int64

    /**
     * The size of the stream output buffer in bytes.
     */
    SizeInBytes : Int64

    /**
     * The location of the value of how much data has been filled into the buffer, as a D3D12_GPU_VIRTUAL_ADDRESS (a UINT64).
     *             This member can't be NULL; a filled size location must be supplied (which the hardware will increment as data is output).
     *             If <b>SizeInBytes</b> is 0, this member isn't used and can be any value.
     */
    BufferFilledSizeLocation : Int64

}
