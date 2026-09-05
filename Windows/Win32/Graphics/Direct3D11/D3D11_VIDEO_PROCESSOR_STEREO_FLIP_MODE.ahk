#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * For stereo 3D video, specifies whether the data in frame 0 or frame 1 is flipped, either horizontally or vertically.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_flip_mode
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_PROCESSOR_STEREO_FLIP_MODE extends Win32Enum {

    /**
     * Neither frame is flipped.
     * Native name: D3D11_VIDEO_PROCESSOR_STEREO_FLIP_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The data in frame 0 is flipped.
     * Native name: D3D11_VIDEO_PROCESSOR_STEREO_FLIP_FRAME0
     * @type {Integer (Int32)}
     */
    static FRAME0 => 1

    /**
     * The data in frame 1 is flipped.
     * Native name: D3D11_VIDEO_PROCESSOR_STEREO_FLIP_FRAME1
     * @type {Integer (Int32)}
     */
    static FRAME1 => 2
}
