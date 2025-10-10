#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the interlace type of coded video frames.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ne-d3d12video-d3d12_video_frame_coded_interlace_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE{

    /**
     * The coded frames are not interlaced, often referred to as "progressive".
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_NONE => 0

    /**
     * The coded frames may be interlaced.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_FIELD_BASED => 1
}
