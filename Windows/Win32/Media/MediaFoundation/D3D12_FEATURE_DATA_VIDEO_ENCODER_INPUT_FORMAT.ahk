#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk

/**
 * Retrieves a value indicating if the specified codec, profile, and format are supported for video encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_input_format
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_INPUT_FORMAT extends Win32Struct
{
    static sizeof => 32

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
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which support is being queried.
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the profile for which support is being queried.
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    Profile{
        get {
            if(!this.HasProp("__Profile"))
                this.__Profile := D3D12_VIDEO_ENCODER_PROFILE_DESC(this.ptr + 8)
            return this.__Profile
        }
    }

    /**
     * A member of the [DXGI_FORMAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) enumeration specifying the pixel format for which support is being queried. This format definition includes the subsampling and bit-depth modes settings for the video encoding session.
     * 
     * To query encoder support for 4:2:0 with 8 and 10 bitdepth samples using following values for the **Format** field:
     * - DXGI_FORMAT_P010
     * - DXGI_FORMAT_NV12
     * 
     * > [!NOTE]
     * > The host is expected to handle the input subsampling and color conversion stages of video encoding.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Receives a boolean value indicating if the specified codec, profile, and format are supported.
     * @type {Integer}
     */
    IsSupported {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
