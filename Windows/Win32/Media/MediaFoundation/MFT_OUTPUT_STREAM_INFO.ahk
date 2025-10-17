#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an output stream on a Media Foundation transform (MFT). To get these values, call IMFTransform::GetOutputStreamInfo.
 * @remarks
 * 
  * Before the media types are set, the only values that should be considered valid is the MFT_OUTPUT_STREAM_OPTIONAL flag in the <b>dwFlags</b> member. This flag indicates that the stream is optional and does not require a media type.
  * 
  * After you set a media type on all of the input and output streams (not including optional streams), all of the values returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">GetOutputStreamInfo</a> method are valid. They might change if you set different media types.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/ns-mftransform-mft_output_stream_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFT_OUTPUT_STREAM_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_output_stream_info_flags">_MFT_OUTPUT_STREAM_INFO_FLAGS</a> enumeration.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Minimum size of each output buffer, in bytes. If the MFT does not require a specific size, the value is zero. For uncompressed audio, the value should be the audio frame size, which you can get from the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-block-alignment-attribute">MF_MT_AUDIO_BLOCK_ALIGNMENT</a> attribute in the media type.
     * 
     * If the <b>dwFlags</b> member contains the MFT_OUTPUT_STREAM_PROVIDES_SAMPLES flag, the value is zero, because the MFT allocates the output buffers.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The memory alignment required for output buffers. If the MFT does not require a specific alignment, the value is zero. If the <b>dwFlags</b> member contains the MFT_OUTPUT_STREAM_PROVIDES_SAMPLES flag, this value is the alignment that the MFT uses internally when it allocates samples. It is recommended, but not required, that MFTs allocate buffers with at least a 16-byte memory alignment.
     * @type {Integer}
     */
    cbAlignment {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 12
    }
}
