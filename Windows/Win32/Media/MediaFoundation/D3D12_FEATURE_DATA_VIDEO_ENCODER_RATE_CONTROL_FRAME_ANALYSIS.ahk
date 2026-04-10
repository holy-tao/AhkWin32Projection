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
#Include .\D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE.ahk
#Include .\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE.ahk
#Include .\D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAGS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS extends Win32Struct {
    static sizeof => 144

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
     * @type {DXGI_FORMAT}
     */
    InputFormat {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    InputResolution {
        get {
            if(!this.HasProp("__InputResolution"))
                this.__InputResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(44, this)
            return this.__InputResolution
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION}
     */
    CodecConfiguration {
        get {
            if(!this.HasProp("__CodecConfiguration"))
                this.__CodecConfiguration := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION(56, this)
            return this.__CodecConfiguration
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE}
     */
    SubregionFrameEncoding {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA}
     */
    SubregionFrameEncodingData {
        get {
            if(!this.HasProp("__SubregionFrameEncodingData"))
                this.__SubregionFrameEncodingData := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA(80, this)
            return this.__SubregionFrameEncodingData
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION}
     */
    QPMap {
        get {
            if(!this.HasProp("__QPMap"))
                this.__QPMap := D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION(96, this)
            return this.__QPMap
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_DIRTY_REGIONS_CONFIGURATION}
     */
    DirtyRegions {
        get {
            if(!this.HasProp("__DirtyRegions"))
                this.__DirtyRegions := D3D12_VIDEO_ENCODER_DIRTY_REGIONS_CONFIGURATION(104, this)
            return this.__DirtyRegions
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION}
     */
    MotionSearch {
        get {
            if(!this.HasProp("__MotionSearch"))
                this.__MotionSearch := D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION(116, this)
            return this.__MotionSearch
        }
    }

    /**
     * @type {Integer}
     */
    Pow2DownscaleFactor {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS_SUPPORT_FLAGS}
     */
    SupportFlags {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }
}
