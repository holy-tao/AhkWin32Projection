#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies flags for video encoder sequence control properties.
 * @remarks
 * Note that depending on the codec, a request for reconfiguration might need to insert an IDR in the bitstream and new SPS headers.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_sequence_control_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAGS{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_NONE => 0

    /**
     * Indicates a change in [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC.PictureTargetResolution](ns-d3d12video-d3d12_video_encoder_sequence_control_desc.md).
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_RESOLUTION_CHANGE => 1

    /**
     * Indicates a change in [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC.RateControl]((ns-d3d12video-d3d12_video_encoder_sequence_control_desc.md).
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_RATE_CONTROL_CHANGE => 2

    /**
     * Indicates a change in [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC.SelectedLayoutMode](ns-d3d12video-d3d12_video_encoder_sequence_control_desc.md) or [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC.pFrameSubregionsLayoutData](ns-d3d12video-d3d12_video_encoder_sequence_control_desc.md).
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_SUBREGION_LAYOUT_CHANGE => 4

    /**
     * Starts an intra-refresh session starting at this frame using the configuration in [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC.IntraRefreshConfig](ns-d3d12video-d3d12_video_encoder_sequence_control_desc.md).
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_REQUEST_INTRA_REFRESH => 8

    /**
     * Indicates a change in [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC.CodecGOPSequence](ns-d3d12video-d3d12_video_encoder_sequence_control_desc.md).
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_GOP_SEQUENCE_CHANGE => 16
}
