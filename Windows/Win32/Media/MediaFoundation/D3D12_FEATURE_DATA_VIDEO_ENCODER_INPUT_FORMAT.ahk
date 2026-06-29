#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }

/**
 * Retrieves a value indicating if the specified codec, profile, and format are supported for video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_input_format
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_INPUT_FORMAT {
    #StructPack 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which support is being queried.
     */
    Codec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the profile for which support is being queried.
     */
    Profile : D3D12_VIDEO_ENCODER_PROFILE_DESC

    /**
     * A member of the [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) enumeration specifying the pixel format for which support is being queried. This format definition includes the subsampling and bit-depth modes settings for the video encoding session.
     * 
     * To query encoder support for 4:2:0 with 8 and 10 bitdepth samples using following values for the **Format** field:
     * - DXGI_FORMAT_P010
     * - DXGI_FORMAT_NV12
     * 
     * > [!NOTE]
     * > The host is expected to handle the input subsampling and color conversion stages of video encoding.
     */
    Format : DXGI_FORMAT

    /**
     * Receives a boolean value indicating if the specified codec, profile, and format are supported.
     */
    IsSupported : BOOL

}
