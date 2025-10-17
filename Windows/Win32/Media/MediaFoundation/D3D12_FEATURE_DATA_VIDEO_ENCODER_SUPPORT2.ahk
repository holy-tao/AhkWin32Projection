#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_ANALYSIS_CONFIGURATION.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT2 extends Win32Struct
{
    static sizeof => 232

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
     * @type {Integer}
     */
    InputFormat {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION}
     */
    CodecConfiguration{
        get {
            if(!this.HasProp("__CodecConfiguration"))
                this.__CodecConfiguration := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION(16, this)
            return this.__CodecConfiguration
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE}
     */
    CodecGopSequence{
        get {
            if(!this.HasProp("__CodecGopSequence"))
                this.__CodecGopSequence := D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE(32, this)
            return this.__CodecGopSequence
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_RATE_CONTROL}
     */
    RateControl{
        get {
            if(!this.HasProp("__RateControl"))
                this.__RateControl := D3D12_VIDEO_ENCODER_RATE_CONTROL(48, this)
            return this.__RateControl
        }
    }

    /**
     * @type {Integer}
     */
    IntraRefresh {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    SubregionFrameEncoding {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    ResolutionsListCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC>}
     */
    pResolutionList {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    MaxReferenceFramesInDPB {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    ValidationFlags {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    SuggestedProfile{
        get {
            if(!this.HasProp("__SuggestedProfile"))
                this.__SuggestedProfile := D3D12_VIDEO_ENCODER_PROFILE_DESC(120, this)
            return this.__SuggestedProfile
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    SuggestedLevel{
        get {
            if(!this.HasProp("__SuggestedLevel"))
                this.__SuggestedLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(136, this)
            return this.__SuggestedLevel
        }
    }

    /**
     * @type {Pointer<D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS1>}
     */
    pResolutionDependentSupport {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA}
     */
    SubregionFrameEncodingData{
        get {
            if(!this.HasProp("__SubregionFrameEncodingData"))
                this.__SubregionFrameEncodingData := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA(160, this)
            return this.__SubregionFrameEncodingData
        }
    }

    /**
     * @type {Integer}
     */
    MaxQualityVsSpeed {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION}
     */
    QPMap{
        get {
            if(!this.HasProp("__QPMap"))
                this.__QPMap := D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION(184, this)
            return this.__QPMap
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_DIRTY_REGIONS_CONFIGURATION}
     */
    DirtyRegions{
        get {
            if(!this.HasProp("__DirtyRegions"))
                this.__DirtyRegions := D3D12_VIDEO_ENCODER_DIRTY_REGIONS_CONFIGURATION(192, this)
            return this.__DirtyRegions
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION}
     */
    MotionSearch{
        get {
            if(!this.HasProp("__MotionSearch"))
                this.__MotionSearch := D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION(208, this)
            return this.__MotionSearch
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_FRAME_ANALYSIS_CONFIGURATION}
     */
    FrameAnalysis{
        get {
            if(!this.HasProp("__FrameAnalysis"))
                this.__FrameAnalysis := D3D12_VIDEO_ENCODER_FRAME_ANALYSIS_CONFIGURATION(224, this)
            return this.__FrameAnalysis
        }
    }
}
