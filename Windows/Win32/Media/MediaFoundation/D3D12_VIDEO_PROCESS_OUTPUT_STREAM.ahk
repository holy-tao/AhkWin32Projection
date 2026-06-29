#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Represents the output stream for video processing commands.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_output_stream
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_OUTPUT_STREAM {
    #StructPack 8

    /**
     * A pointer to a [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the output surfaces for the video process command.
     */
    pTexture2D : ID3D12Resource

    /**
     * The subresource indices to use within the resource specified *pTexture2D* resource.
     */
    Subresource : UInt32

}
