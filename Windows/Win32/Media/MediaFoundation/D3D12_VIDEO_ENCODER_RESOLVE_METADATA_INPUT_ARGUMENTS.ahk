#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk

/**
 * Represents input arguments for a call to ID3D12VideoEncodeCommandList2::ResolveEncoderOutputMetadata.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_resolve_metadata_input_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) specifying the codec of the associated encode operation.
     * @type {Integer}
     */
    EncoderCodec {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) specifying the profile for the selected codec in the associated encode operation.
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    EncoderProfile{
        get {
            if(!this.HasProp("__EncoderProfile"))
                this.__EncoderProfile := D3D12_VIDEO_ENCODER_PROFILE_DESC(8, this)
            return this.__EncoderProfile
        }
    }

    /**
     * A [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) specifying the input format of the associated encode operation.
     * @type {Integer}
     */
    EncoderInputFormat {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC](ns-d3d12video-d3d12_video_encoder_picture_resolution_desc.md) structure describing the resolution used for the encoding operation.
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    EncodedPictureEffectiveResolution{
        get {
            if(!this.HasProp("__EncodedPictureEffectiveResolution"))
                this.__EncodedPictureEffectiveResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(32, this)
            return this.__EncodedPictureEffectiveResolution
        }
    }

    /**
     * A [D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER](ns-d3d12video-d3d12_video_encoder_encode_operation_metadata_buffer.md) representing the associated opaque metadata buffer received from [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md).
     * @type {D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER}
     */
    HWLayoutMetadata{
        get {
            if(!this.HasProp("__HWLayoutMetadata"))
                this.__HWLayoutMetadata := D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER(40, this)
            return this.__HWLayoutMetadata
        }
    }
}
