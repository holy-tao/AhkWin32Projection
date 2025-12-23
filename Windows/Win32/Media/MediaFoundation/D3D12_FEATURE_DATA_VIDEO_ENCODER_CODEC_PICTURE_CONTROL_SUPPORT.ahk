#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT.ahk

/**
 * Retrieves the picture control support for the specified codec and profile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_codec_picture_control_support
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT extends Win32Struct
{
    static sizeof => 48

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
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which picture control support is being queried.
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which picture control support is being queried.
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
     * Gets a boolean value indicating if the provided values are supported.
     * @type {BOOL}
     */
    IsSupported {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Receives a [D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT](ns-d3d12video-d3d12_video_encoder_codec_picture_control_support.md) structure representing the picture control support for the provided values.
     * @type {D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT}
     */
    PictureSupport{
        get {
            if(!this.HasProp("__PictureSupport"))
                this.__PictureSupport := D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT(32, this)
            return this.__PictureSupport
        }
    }
}
