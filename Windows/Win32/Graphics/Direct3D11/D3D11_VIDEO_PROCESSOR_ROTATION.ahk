#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the video rotation states.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_rotation
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_PROCESSOR_ROTATION extends Win32Enum {

    /**
     * The video is not rotated.
     * Native name: D3D11_VIDEO_PROCESSOR_ROTATION_IDENTITY
     * @type {Integer (Int32)}
     */
    static IDENTITY => 0

    /**
     * The video is rotated 90 degrees clockwise.
     * Native name: D3D11_VIDEO_PROCESSOR_ROTATION_90
     * @type {Integer (Int32)}
     */
    static 90 => 1

    /**
     * The video is rotated 180 degrees clockwise.
     * Native name: D3D11_VIDEO_PROCESSOR_ROTATION_180
     * @type {Integer (Int32)}
     */
    static 180 => 2

    /**
     * The video is rotated 270 degrees clockwise.
     * Native name: D3D11_VIDEO_PROCESSOR_ROTATION_270
     * @type {Integer (Int32)}
     */
    static 270 => 3
}
