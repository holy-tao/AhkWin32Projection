#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }

/**
 * Retrieves a value indicating if the specified rate control mode is supported for video encoding with the specified codec
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_rate_control_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_RATE_CONTROL_MODE {
    #StructPack 4

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which rate control mode support is being queried.
     */
    Codec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A member of the [D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE](ne-d3d12video-d3d12_video_encoder_rate_control_mode.md) enumeration specifying the rate control mode for which support is being queried.
     */
    RateControlMode : D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE

    /**
     * Receives a boolean value indicating if the specified rate control mode is supported for the specified codec.
     */
    IsSupported : BOOL

}
