#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk

/**
 * Retrieves values indicating resource requirements for video encoding with the specified encoding configuration.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_resource_requirements
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOURCE_REQUIREMENTS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which resource requirements are being queried.
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which resource requirements are being queried.
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    Profile{
        get {
            if(!this.HasProp("__Profile"))
                this.__Profile := D3D12_VIDEO_ENCODER_PROFILE_DESC(8, this)
            return this.__Profile
        }
    }

    /**
     * A [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) structure representing the input format for which resource requirements are being queried.
     * @type {Integer}
     */
    InputFormat {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) structure representing the resolution for which resource requirements are being queried.
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    PictureTargetResolution{
        get {
            if(!this.HasProp("__PictureTargetResolution"))
                this.__PictureTargetResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(32, this)
            return this.__PictureTargetResolution
        }
    }

    /**
     * Receives a boolean value indicating if the specified parameters are supported.
     * @type {BOOL}
     */
    IsSupported {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Receives a UINT indicating the alignment required in bytes for the resource to be passed in [D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.pBuffer](ns-d3d12video-d3d12_video_encoder_compressed_bitstream.md) and **D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.Offset**. If no alignment is required, 1 should is returned to indicate 1 byte (trivial) alignment.
     * @type {Integer}
     */
    CompressedBitstreamBufferAccessAlignment {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Receives a UINT indicating the alignment required in bytes for the resource to be passed in D3D12_VIDEO_ENCODER_OUTPUT_ARGUMENTS.pEncoderOutputMetadata. If no alignment required, 1 should be reported to convey 1 byte (trivial) alignment.
     * @type {Integer}
     */
    EncoderMetadataBufferAccessAlignment {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Receives a UINT indicating the maximum size in bytes needed for the [ID3D12Resource](/windows/win32/api/d3d12/nn-d3d12-id3d12resource) that will be allocated by the host and used as output in the [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) for output encoder metadata based on the input arguments.
     * @type {Integer}
     */
    MaxEncoderOutputMetadataBufferSize {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
