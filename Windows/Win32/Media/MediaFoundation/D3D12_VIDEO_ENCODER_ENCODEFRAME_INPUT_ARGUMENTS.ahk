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
 * Represents input arguments to ID3D12VideoEncodeCommandList2::EncodeFrame.
 * @remarks
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
     * A [D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC](ns-d3d12video-d3d12_video_encoder_sequence_control_desc.md) specifying the configuration for the video sequence
     * @type {D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC}
     */
    SequenceControlDesc{
        get {
            if(!this.HasProp("__SequenceControlDesc"))
                this.__SequenceControlDesc := D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC(this.ptr + 0)
            return this.__SequenceControlDesc
        }
    }

    /**
     * A [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC](ns-d3d12video-d3d12_video_encoder_picture_control_desc.md) specifying the configuration for the video picture.
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC}
     */
    PictureControlDesc{
        get {
            if(!this.HasProp("__PictureControlDesc"))
                this.__PictureControlDesc := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC(this.ptr + 96)
            return this.__PictureControlDesc
        }
    }

    /**
     * An [ID3D12Resource](../d3d12/nn-d3d12-id3d12resource) representing the frame to encode.
     * @type {Pointer<ID3D12Resource>}
     */
    pInputFrame {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * A UINT64 specifying the subresource index for *pInputFrame*.
     * @type {Integer}
     */
    InputFrameSubresource {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * A UINT64 specifying the number of bytes added to the final bitstream between the end of the last **EncodeFrame** compressed bitstream output and the current call output. This is intended to capture the size of any headers or metadata messages added by the client to the final bitstream which are used as a hint by the rate control algorithms to keep track of the full bitstream size.
     * @type {Integer}
     */
    CurrentFrameBitstreamMetadataSize {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }
}
