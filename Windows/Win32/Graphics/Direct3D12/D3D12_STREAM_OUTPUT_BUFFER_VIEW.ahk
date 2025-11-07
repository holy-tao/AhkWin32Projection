#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a stream output buffer.
 * @remarks
 * 
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-sosettargets">SOSetTargets</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_stream_output_buffer_view
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_STREAM_OUTPUT_BUFFER_VIEW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A D3D12_GPU_VIRTUAL_ADDRESS (a UINT64) that points to the stream output buffer.
     *             If <b>SizeInBytes</b> is 0, this member isn't used and can be any value.
     * @type {Integer}
     */
    BufferLocation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the stream output buffer in bytes.
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The location of the value of how much data has been filled into the buffer, as a D3D12_GPU_VIRTUAL_ADDRESS (a UINT64).
     *             This member can't be NULL; a filled size location must be supplied (which the hardware will increment as data is output).
     *             If <b>SizeInBytes</b> is 0, this member isn't used and can be any value.
     * @type {Integer}
     */
    BufferFilledSizeLocation {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
