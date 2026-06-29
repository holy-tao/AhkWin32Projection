#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Contains the reference frames needed to perform video processing.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_reference_set
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_REFERENCE_SET {
    #StructPack 8

    /**
     * The number of past reference frames provided in *ppPastFrames*.
     */
    NumPastFrames : UInt32

    /**
     * A pointer to an array of [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) surfaces. The number of elements in the array is *NumPastFrames*.
     */
    ppPastFrames : ID3D12Resource.Ptr

    /**
     * An array of subresource indices for the list of *ppPastFrames* textures.  NULL indicates subresource 0 for each resource.
     */
    pPastSubresources : IntPtr

    /**
     * The number of future reference frames provided in *ppPastFrames*.
     */
    NumFutureFrames : UInt32

    /**
     * A pointer to an array of [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) surfaces. The number of elements in the array is *NumFutureFrames*.
     */
    ppFutureFrames : ID3D12Resource.Ptr

    /**
     * An array of subresource indices for the list of *ppFutureFrames* textures.  NULL indicates subresource 0 for each resource.
     */
    pFutureSubresources : IntPtr

}
