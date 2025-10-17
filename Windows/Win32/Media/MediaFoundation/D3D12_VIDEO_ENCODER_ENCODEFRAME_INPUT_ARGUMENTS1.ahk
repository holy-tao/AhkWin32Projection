#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_INTRA_REFRESH.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE.ahk
#Include .\D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA1.ahk
#Include .\D3D12_VIDEO_ENCODE_REFERENCE_FRAMES.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_MOTION_VECTORS.ahk
#Include .\D3D12_VIDEO_ENCODER_DIRTY_REGIONS.ahk
#Include .\D3D12_VIDEO_ENCODER_QUANTIZATION_OPAQUE_MAP.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_ANALYSIS.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC1.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS1 extends Win32Struct
{
    static sizeof => 248

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC}
     */
    SequenceControlDesc{
        get {
            if(!this.HasProp("__SequenceControlDesc"))
                this.__SequenceControlDesc := D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC(0, this)
            return this.__SequenceControlDesc
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC1}
     */
    PictureControlDesc{
        get {
            if(!this.HasProp("__PictureControlDesc"))
                this.__PictureControlDesc := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC1(96, this)
            return this.__PictureControlDesc
        }
    }

    /**
     * @type {Pointer<ID3D12Resource>}
     */
    pInputFrame {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    InputFrameSubresource {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * @type {Integer}
     */
    CurrentFrameBitstreamMetadataSize {
        get => NumGet(this, 236, "uint")
        set => NumPut("uint", value, this, 236)
    }

    /**
     * @type {Integer}
     */
    OptionalMetadata {
        get => NumGet(this, 240, "int")
        set => NumPut("int", value, this, 240)
    }
}
