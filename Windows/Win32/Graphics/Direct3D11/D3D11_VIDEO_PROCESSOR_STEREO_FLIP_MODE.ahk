#Requires AutoHotkey v2.0.0 64-bit

/**
 * For stereo 3D video, specifies whether the data in frame 0 or frame 1 is flipped, either horizontally or vertically.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_flip_mode
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_STEREO_FLIP_MODE{

    /**
     * Neither frame is flipped.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FLIP_NONE => 0

    /**
     * The data in frame 0 is flipped.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FLIP_FRAME0 => 1

    /**
     * The data in frame 1 is flipped.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FLIP_FRAME1 => 2
}
