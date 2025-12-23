#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS1 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    EncoderCodec {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
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
     * @type {Integer}
     */
    EncoderInputFormat {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    EncodedPictureEffectiveResolution{
        get {
            if(!this.HasProp("__EncodedPictureEffectiveResolution"))
                this.__EncodedPictureEffectiveResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(28, this)
            return this.__EncodedPictureEffectiveResolution
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER}
     */
    HWLayoutMetadata{
        get {
            if(!this.HasProp("__HWLayoutMetadata"))
                this.__HWLayoutMetadata := D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER(40, this)
            return this.__HWLayoutMetadata
        }
    }

    /**
     * @type {Integer}
     */
    OptionalMetadata {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION}
     */
    CodecConfiguration{
        get {
            if(!this.HasProp("__CodecConfiguration"))
                this.__CodecConfiguration := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION(64, this)
            return this.__CodecConfiguration
        }
    }
}
