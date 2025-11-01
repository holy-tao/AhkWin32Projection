#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk

/**
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
                this.__PictureTargetResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(32, this)
            return this.__PictureTargetResolution
        }
    }

    /**
     * @type {BOOL}
     */
    IsSupported {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    CompressedBitstreamBufferAccessAlignment {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    EncoderMetadataBufferAccessAlignment {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MaxEncoderOutputMetadataBufferSize {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
