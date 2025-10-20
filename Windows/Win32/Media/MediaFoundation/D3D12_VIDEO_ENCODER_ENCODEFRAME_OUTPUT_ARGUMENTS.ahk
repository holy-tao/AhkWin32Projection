#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.ahk
#Include .\D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE.ahk
#Include .\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_encodeframe_output_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM}
     */
    Bitstream{
        get {
            if(!this.HasProp("__Bitstream"))
                this.__Bitstream := D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM(0, this)
            return this.__Bitstream
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE}
     */
    ReconstructedPicture{
        get {
            if(!this.HasProp("__ReconstructedPicture"))
                this.__ReconstructedPicture := D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE(16, this)
            return this.__ReconstructedPicture
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER}
     */
    EncoderOutputMetadata{
        get {
            if(!this.HasProp("__EncoderOutputMetadata"))
                this.__EncoderOutputMetadata := D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER(32, this)
            return this.__EncoderOutputMetadata
        }
    }
}
