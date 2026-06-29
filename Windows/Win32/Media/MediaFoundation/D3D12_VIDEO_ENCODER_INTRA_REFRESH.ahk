#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE.ahk" { D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE }

/**
 * Represents intra refresh settings for video encoding.
 * @remarks
 * When triggering an intra-refresh session, the host informs the current frame number relative to the [0..*IntraRefreshDuration*) session by setting *IntraRefreshFrameIndex* in the picture control structures.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_intra_refresh
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_INTRA_REFRESH {
    #StructPack 4

    /**
     * A value from the [D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE](ne-d3d12video-d3d12_video_encoder_intra_refresh_mode.md) enumeration specifying the intra refresh mode.
     */
    Mode : D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE

    /**
     * A UINT64 specifying the duration of the intra-refresh session, as a number of frames . For D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE_ROW_BASED, this value and the frame height define the size of the I rows for the duration of the IR session.
     */
    IntraRefreshDuration : UInt32

}
