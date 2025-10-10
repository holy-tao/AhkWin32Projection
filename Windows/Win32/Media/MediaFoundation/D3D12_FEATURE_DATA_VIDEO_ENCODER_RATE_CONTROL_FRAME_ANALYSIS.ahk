#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS extends Win32Struct
{
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
                this.__Profile := D3D12_VIDEO_ENCODER_PROFILE_DESC(this.ptr + 8)
            return this.__Profile
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    Level{
        get {
            if(!this.HasProp("__Level"))
                this.__Level := D3D12_VIDEO_ENCODER_LEVEL_SETTING(this.ptr + 24)
            return this.__Level
        }
    }

    /**
     * @type {Integer}
     */
    InputFormat {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    InputResolution{
        get {
            if(!this.HasProp("__InputResolution"))
                this.__InputResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(this.ptr + 48)
            return this.__InputResolution
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION}
     */
    CodecConfiguration{
        get {
            if(!this.HasProp("__CodecConfiguration"))
                this.__CodecConfiguration := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION(this.ptr + 56)
            return this.__CodecConfiguration
        }
    }

    /**
     * @type {Integer}
     */
    SubregionFrameEncoding {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA}
     */
    SubregionFrameEncodingData{
        get {
            if(!this.HasProp("__SubregionFrameEncodingData"))
                this.__SubregionFrameEncodingData := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA(this.ptr + 80)
            return this.__SubregionFrameEncodingData
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION}
     */
    QPMap{
        get {
            if(!this.HasProp("__QPMap"))
                this.__QPMap := D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION(this.ptr + 96)
            return this.__QPMap
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_DIRTY_REGIONS_CONFIGURATION}
     */
    DirtyRegions{
        get {
            if(!this.HasProp("__DirtyRegions"))
                this.__DirtyRegions := D3D12_VIDEO_ENCODER_DIRTY_REGIONS_CONFIGURATION(this.ptr + 104)
            return this.__DirtyRegions
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION}
     */
    MotionSearch{
        get {
            if(!this.HasProp("__MotionSearch"))
                this.__MotionSearch := D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION(this.ptr + 120)
            return this.__MotionSearch
        }
    }

    /**
     * @type {Integer}
     */
    Pow2DownscaleFactor {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 140, "int")
        set => NumPut("int", value, this, 140)
    }
}
