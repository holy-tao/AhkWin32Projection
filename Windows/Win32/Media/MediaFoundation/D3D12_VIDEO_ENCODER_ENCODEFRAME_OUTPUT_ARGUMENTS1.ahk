#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.ahk
#Include .\D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM.ahk
#Include .\D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM1.ahk
#Include .\D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE.ahk
#Include .\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS1 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM1}
     */
    Bitstream{
        get {
            if(!this.HasProp("__Bitstream"))
                this.__Bitstream := D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM1(this.ptr + 0)
            return this.__Bitstream
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE}
     */
    ReconstructedPicture{
        get {
            if(!this.HasProp("__ReconstructedPicture"))
                this.__ReconstructedPicture := D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE(this.ptr + 64)
            return this.__ReconstructedPicture
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER}
     */
    EncoderOutputMetadata{
        get {
            if(!this.HasProp("__EncoderOutputMetadata"))
                this.__EncoderOutputMetadata := D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER(this.ptr + 80)
            return this.__EncoderOutputMetadata
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE}
     */
    FrameAnalysisReconstructedPicture{
        get {
            if(!this.HasProp("__FrameAnalysisReconstructedPicture"))
                this.__FrameAnalysisReconstructedPicture := D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE(this.ptr + 96)
            return this.__FrameAnalysisReconstructedPicture
        }
    }
}
