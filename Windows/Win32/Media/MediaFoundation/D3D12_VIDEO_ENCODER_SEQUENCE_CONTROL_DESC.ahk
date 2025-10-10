#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_INTRA_REFRESH.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INTRA_REFRESH}
     */
    IntraRefreshConfig{
        get {
            if(!this.HasProp("__IntraRefreshConfig"))
                this.__IntraRefreshConfig := D3D12_VIDEO_ENCODER_INTRA_REFRESH(this.ptr + 8)
            return this.__IntraRefreshConfig
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_RATE_CONTROL}
     */
    RateControl{
        get {
            if(!this.HasProp("__RateControl"))
                this.__RateControl := D3D12_VIDEO_ENCODER_RATE_CONTROL(this.ptr + 16)
            return this.__RateControl
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    PictureTargetResolution{
        get {
            if(!this.HasProp("__PictureTargetResolution"))
                this.__PictureTargetResolution := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(this.ptr + 48)
            return this.__PictureTargetResolution
        }
    }

    /**
     * @type {Integer}
     */
    SelectedLayoutMode {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA}
     */
    FrameSubregionsLayoutData{
        get {
            if(!this.HasProp("__FrameSubregionsLayoutData"))
                this.__FrameSubregionsLayoutData := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA(this.ptr + 64)
            return this.__FrameSubregionsLayoutData
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE}
     */
    CodecGopSequence{
        get {
            if(!this.HasProp("__CodecGopSequence"))
                this.__CodecGopSequence := D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE(this.ptr + 80)
            return this.__CodecGopSequence
        }
    }
}
