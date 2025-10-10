#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT extends Win32Struct
{
    static sizeof => 160

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
                this.__CodecConfiguration := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION(this.ptr + 16)
            return this.__CodecConfiguration
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE}
     */
    CodecGopSequence{
        get {
            if(!this.HasProp("__CodecGopSequence"))
                this.__CodecGopSequence := D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE(this.ptr + 32)
            return this.__CodecGopSequence
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_RATE_CONTROL}
     */
    RateControl{
        get {
            if(!this.HasProp("__RateControl"))
                this.__RateControl := D3D12_VIDEO_ENCODER_RATE_CONTROL(this.ptr + 48)
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
                this.__SuggestedProfile := D3D12_VIDEO_ENCODER_PROFILE_DESC(this.ptr + 120)
            return this.__SuggestedProfile
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    SuggestedLevel{
        get {
            if(!this.HasProp("__SuggestedLevel"))
                this.__SuggestedLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(this.ptr + 136)
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
}
