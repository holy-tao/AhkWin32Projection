#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk

/**
 * Retrieves a value indicating if the specified frame subregion layout mode is supported for the specified code, profile, and level.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_encoder_frame_subregion_layout_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE extends Win32Struct
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
     * A member of the [D3D12_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_codec.md) enumeration specifying the codec for which frame subregion layout mode support is being queried.
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure specifying the profile for which frame subregion layout mode support is being queried.
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
     * A [D3D12_VIDEO_ENCODER_LEVEL_SETTING](ns-d3d12video-d3d12_video_encoder_level_setting.md) structure specifying the level for which frame subregion layout mode support is being queried.
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    Level{
        get {
            if(!this.HasProp("__Level"))
                this.__Level := D3D12_VIDEO_ENCODER_LEVEL_SETTING(24, this)
            return this.__Level
        }
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE](ne-d3d12video-d3d12_video_encoder_frame_subregion_layout_mode.md) enumeration specifying the frame subregion layout mode for which support is being queried.
     * @type {Integer}
     */
    SubregionMode {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Receives a boolean value indicating if the specified frame subregion layout mode is supported for the specified codec.
     * @type {BOOL}
     */
    IsSupported {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
