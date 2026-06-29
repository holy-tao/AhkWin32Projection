#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk" { D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk" { D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }

/**
 * Represents input arguments for a call to ID3D12VideoEncodeCommandList2::ResolveEncoderOutputMetadata.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_resolve_metadata_input_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS {
    #StructPack 8

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) specifying the codec of the associated encode operation.
     */
    EncoderCodec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) specifying the profile for the selected codec in the associated encode operation.
     */
    EncoderProfile : D3D12_VIDEO_ENCODER_PROFILE_DESC

    /**
     * A [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) specifying the input format of the associated encode operation.
     */
    EncoderInputFormat : DXGI_FORMAT

    /**
     * A [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) structure describing the resolution used for the encoding operation.
     */
    EncodedPictureEffectiveResolution : D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC

    /**
     * A [D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER](ns-d3d12video-d3d12_video_encoder_encode_operation_metadata_buffer.md) representing the associated opaque metadata buffer received from [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md).
     */
    HWLayoutMetadata : D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER

}
