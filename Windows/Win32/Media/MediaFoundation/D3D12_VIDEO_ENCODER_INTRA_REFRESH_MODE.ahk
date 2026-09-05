#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies video encoder intra refresh modes.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_intra_refresh_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE extends Win32Enum {

    /**
     * The encoder does not use intra refresh.
     * Native name: D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Row-based intra refresh mode.
     * Native name: D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE_ROW_BASED
     * @type {Integer (Int32)}
     */
    static ROW_BASED => 1
}
