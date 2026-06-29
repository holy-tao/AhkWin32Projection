#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_SLICES.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.ahk
#Include .\D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP.ahk
#Include .\D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE.ahk
#Include .\D3D12_VIDEO_ENCODER_SUPPORT_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR1.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_HEVC.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR1.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_VALIDATION_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVELS_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_SEQUENCE_STRUCTURE.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_TILES.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT1 extends Win32Struct {
    static sizeof => 184

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
     * @type {DXGI_FORMAT}
     */
    InputFormat {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION}
     */
    CodecConfiguration {
        get {
            if(!this.HasProp("__CodecConfiguration"))
                this.__CodecConfiguration := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION(16, this)
            return this.__CodecConfiguration
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE}
     */
    CodecGopSequence {
        get {
            if(!this.HasProp("__CodecGopSequence"))
                this.__CodecGopSequence := D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE(32, this)
            return this.__CodecGopSequence
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_RATE_CONTROL}
     */
    RateControl {
        get {
            if(!this.HasProp("__RateControl"))
                this.__RateControl := D3D12_VIDEO_ENCODER_RATE_CONTROL(48, this)
            return this.__RateControl
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE}
     */
    IntraRefresh {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE}
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
     * @type {D3D12_VIDEO_ENCODER_VALIDATION_FLAGS}
     */
    ValidationFlags {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_SUPPORT_FLAGS}
     */
    SupportFlags {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    SuggestedProfile {
        get {
            if(!this.HasProp("__SuggestedProfile"))
                this.__SuggestedProfile := D3D12_VIDEO_ENCODER_PROFILE_DESC(120, this)
            return this.__SuggestedProfile
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    SuggestedLevel {
        get {
            if(!this.HasProp("__SuggestedLevel"))
                this.__SuggestedLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(136, this)
            return this.__SuggestedLevel
        }
    }

    /**
     * @type {Pointer<D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS>}
     */
    pResolutionDependentSupport {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA}
     */
    SubregionFrameEncodingData {
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
}
