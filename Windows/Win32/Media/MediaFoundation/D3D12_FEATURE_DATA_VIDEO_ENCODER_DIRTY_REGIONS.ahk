#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVELS_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_SLICES.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_TILES.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE.ahk
#Include .\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE.ahk
#Include .\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAGS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_DIRTY_REGIONS extends Win32Struct {
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO}
     */
    SessionInfo {
        get {
            if(!this.HasProp("__SessionInfo"))
                this.__SessionInfo := D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO(8, this)
            return this.__SessionInfo
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE}
     */
    MapSource {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE}
     */
    MapValuesType {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAGS}
     */
    SupportFlags {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    MapSourcePreferenceRanking {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }
}
