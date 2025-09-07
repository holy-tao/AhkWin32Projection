#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents intra refresh settings for video encoding.
 * @remarks
 * When triggering an intra-refresh session, the host informs the current frame number relative to the [0..*IntraRefreshDuration*) session by setting *IntraRefreshFrameIndex* in the picture control structures.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_intra_refresh
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_INTRA_REFRESH extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A value from the [D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE](ne-d3d12video-d3d12_video_encoder_intra_refresh_mode.md) enumeration specifying the intra refresh mode.
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A UINT64 specifying the duration of the intra-refresh session, as a number of frames . For D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE_ROW_BASED, this value and the frame height define the size of the I rows for the duration of the IR session.
     * @type {Integer}
     */
    IntraRefreshDuration {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
