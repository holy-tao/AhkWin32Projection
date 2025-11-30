#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the video rotation states.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_rotation
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_ROTATION extends Win32Enum{

    /**
     * The video is not rotated.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ROTATION_IDENTITY => 0

    /**
     * The video is rotated 90 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ROTATION_90 => 1

    /**
     * The video is rotated 180 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ROTATION_180 => 2

    /**
     * The video is rotated 270 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ROTATION_270 => 3
}
