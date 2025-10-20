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
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA.ahk
#Include .\D3D12_VIDEO_ENCODE_REFERENCE_FRAMES.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_encodeframe_input_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS extends Win32Struct
{
    static sizeof => 160

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
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC}
     */
    PictureControlDesc{
        get {
            if(!this.HasProp("__PictureControlDesc"))
                this.__PictureControlDesc := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC(96, this)
            return this.__PictureControlDesc
        }
    }

    /**
     * @type {ID3D12Resource}
     */
    pInputFrame {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    InputFrameSubresource {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    CurrentFrameBitstreamMetadataSize {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }
}
