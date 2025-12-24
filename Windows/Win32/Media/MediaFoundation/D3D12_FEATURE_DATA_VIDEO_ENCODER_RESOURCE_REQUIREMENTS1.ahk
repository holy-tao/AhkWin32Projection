#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOURCE_REQUIREMENTS1 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
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
     * @type {Integer}
     */
    InputFormat {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    PictureTargetResolution{
        get {
            if(!this.HasProp("__PictureTargetResolution"))
                this.__PictureTargetResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(28, this)
            return this.__PictureTargetResolution
        }
    }

    /**
     * @type {BOOL}
     */
    IsSupported {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    CompressedBitstreamBufferAccessAlignment {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    EncoderMetadataBufferAccessAlignment {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    MaxEncoderOutputMetadataBufferSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    OptionalMetadata {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION}
     */
    CodecConfiguration{
        get {
            if(!this.HasProp("__CodecConfiguration"))
                this.__CodecConfiguration := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION(56, this)
            return this.__CodecConfiguration
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    EncoderOutputMetadataQPMapTextureDimensions{
        get {
            if(!this.HasProp("__EncoderOutputMetadataQPMapTextureDimensions"))
                this.__EncoderOutputMetadataQPMapTextureDimensions := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(72, this)
            return this.__EncoderOutputMetadataQPMapTextureDimensions
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    EncoderOutputMetadataSATDMapTextureDimensions{
        get {
            if(!this.HasProp("__EncoderOutputMetadataSATDMapTextureDimensions"))
                this.__EncoderOutputMetadataSATDMapTextureDimensions := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(80, this)
            return this.__EncoderOutputMetadataSATDMapTextureDimensions
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    EncoderOutputMetadataBitAllocationMapTextureDimensions{
        get {
            if(!this.HasProp("__EncoderOutputMetadataBitAllocationMapTextureDimensions"))
                this.__EncoderOutputMetadataBitAllocationMapTextureDimensions := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(88, this)
            return this.__EncoderOutputMetadataBitAllocationMapTextureDimensions
        }
    }

    /**
     * @type {Integer}
     */
    EncoderOutputMetadataFramePSNRComponentsNumber {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    EncoderOutputMetadataSubregionsPSNRComponentsNumber {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    EncoderOutputMetadataSubregionsPSNRResolvedMetadataBufferSize {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }
}
