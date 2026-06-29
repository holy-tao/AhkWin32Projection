#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_ENCODER_CODEC.ahk" { D3D12_VIDEO_ENCODER_CODEC }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_DESC }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk" { D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk" { D3D12_VIDEO_ENCODER_PROFILE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk" { D3D12_VIDEO_ENCODER_AV1_PROFILE }
#Import ".\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk" { D3D12_VIDEO_ENCODER_PROFILE_HEVC }

/**
 * Retrieves values indicating resource requirements for video encoding with the specified encoding configuration.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_resource_requirements
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOURCE_REQUIREMENTS {
    #StructPack 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which resource requirements are being queried.
     */
    Codec : D3D12_VIDEO_ENCODER_CODEC

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which resource requirements are being queried.
     */
    Profile : D3D12_VIDEO_ENCODER_PROFILE_DESC

    /**
     * A [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) structure representing the input format for which resource requirements are being queried.
     */
    InputFormat : DXGI_FORMAT

    /**
     * A [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) structure representing the resolution for which resource requirements are being queried.
     */
    PictureTargetResolution : D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC

    /**
     * Receives a boolean value indicating if the specified parameters are supported.
     */
    IsSupported : BOOL

    /**
     * Receives a UINT indicating the alignment required in bytes for the resource to be passed in [D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.pBuffer](ns-d3d12video-d3d12_video_encoder_compressed_bitstream.md) and **D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.Offset**. If no alignment is required, 1 should is returned to indicate 1 byte (trivial) alignment.
     */
    CompressedBitstreamBufferAccessAlignment : UInt32

    /**
     * Receives a UINT indicating the alignment required in bytes for the resource to be passed in D3D12_VIDEO_ENCODER_OUTPUT_ARGUMENTS.pEncoderOutputMetadata. If no alignment required, 1 should be reported to convey 1 byte (trivial) alignment.
     */
    EncoderMetadataBufferAccessAlignment : UInt32

    /**
     * Receives a UINT indicating the maximum size in bytes needed for the [ID3D12Resource](/windows/win32/api/d3d12/nn-d3d12-id3d12resource) that will be allocated by the host and used as output in the [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) for output encoder metadata based on the input arguments.
     */
    MaxEncoderOutputMetadataBufferSize : UInt32

}
