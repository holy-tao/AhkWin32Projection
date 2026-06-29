#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a video encoder picture resolution.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_resolution_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC {
    #StructPack 4

    /**
     * The resolution width, in pixels.
     */
    Width : UInt32

    /**
     * The resolution height, in pixels.
     */
    Height : UInt32

}
