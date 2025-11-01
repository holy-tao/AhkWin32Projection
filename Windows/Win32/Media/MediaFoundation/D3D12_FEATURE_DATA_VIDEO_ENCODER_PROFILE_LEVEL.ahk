#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk

/**
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
     * @type {BOOL}
     */
    IsSupported {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    MinSupportedLevel{
        get {
            if(!this.HasProp("__MinSupportedLevel"))
                this.__MinSupportedLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(32, this)
            return this.__MinSupportedLevel
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    MaxSupportedLevel{
        get {
            if(!this.HasProp("__MaxSupportedLevel"))
                this.__MaxSupportedLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(48, this)
            return this.__MaxSupportedLevel
        }
    }
}
