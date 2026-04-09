#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVELS_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_CONFIG_SUPPORT.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_SUPPORT.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_CONFIG extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    Profile {
        get {
            if(!this.HasProp("__Profile"))
                this.__Profile := D3D12_VIDEO_ENCODER_PROFILE_DESC(8, this)
            return this.__Profile
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    Level {
        get {
            if(!this.HasProp("__Level"))
                this.__Level := D3D12_VIDEO_ENCODER_LEVEL_SETTING(24, this)
            return this.__Level
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE}
     */
    SubregionMode {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    FrameResolution {
        get {
            if(!this.HasProp("__FrameResolution"))
                this.__FrameResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(44, this)
            return this.__FrameResolution
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_CONFIG_SUPPORT}
     */
    CodecSupport {
        get {
            if(!this.HasProp("__CodecSupport"))
                this.__CodecSupport := D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_CONFIG_SUPPORT(56, this)
            return this.__CodecSupport
        }
    }

    /**
     * @type {BOOL}
     */
    IsSupported {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }
}
