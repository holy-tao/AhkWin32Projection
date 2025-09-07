#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk

/**
 * Retrieves a value indicating if the specified profile is supported for video encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_profile_level
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_PROFILE_LEVEL extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which the supported profile level is being queried.
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which  support is being queried.
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
     * Receives a boolean value indicating if the specified profile is supported for the specified codec.
     * @type {Integer}
     */
    IsSupported {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Output field that receives the minimum supported level for the selected codec and profile if supported.
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    MinSupportedLevel{
        get {
            if(!this.HasProp("__MinSupportedLevel"))
                this.__MinSupportedLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(this.ptr + 32)
            return this.__MinSupportedLevel
        }
    }

    /**
     * Output field that receives the maximum supported level for the selected codec and profile if supported.
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    MaxSupportedLevel{
        get {
            if(!this.HasProp("__MaxSupportedLevel"))
                this.__MaxSupportedLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(this.ptr + 48)
            return this.__MaxSupportedLevel
        }
    }
}
