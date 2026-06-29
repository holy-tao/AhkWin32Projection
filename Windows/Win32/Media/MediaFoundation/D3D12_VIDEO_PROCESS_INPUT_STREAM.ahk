#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROCESS_REFERENCE_SET.ahk" { D3D12_VIDEO_PROCESS_REFERENCE_SET }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Contains input information for the video processor blend functionality.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_input_stream
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_INPUT_STREAM {
    #StructPack 8

    /**
     * An [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the current input field or frame.
     */
    pTexture2D : ID3D12Resource

    /**
     * The subresource index to use of the *pTexture2D* argument.
     */
    Subresource : UInt32

    /**
     * A [D3D12_VIDEO_PROCESS_REFERENCE_SET](ns-d3d12video-d3d12_video_process_reference_set.md) containing the set of references for video processing. Some video processing algorithms require forward or backward frame references. For more information, see [D3D12_FEATURE_VIDEO_PROCESS_REFERENCE_INFO](ne-d3d12video-d3d12_feature_video.md).
     */
    ReferenceSet : D3D12_VIDEO_PROCESS_REFERENCE_SET

}
