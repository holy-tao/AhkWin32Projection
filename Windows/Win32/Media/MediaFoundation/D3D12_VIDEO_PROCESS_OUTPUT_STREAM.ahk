#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Resource.ahk

/**
 * Represents the output stream for video processing commands.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_output_stream
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_PROCESS_OUTPUT_STREAM extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the output surfaces for the video process command.
     * @type {ID3D12Resource}
     */
    pTexture2D {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The subresource indices to use within the resource specified *pTexture2D* resource.
     * @type {Integer}
     */
    Subresource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
