#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an input stream on a Media Foundation transform (MFT). To get these values, call IMFTransform::GetInputStreamInfo.
 * @remarks
 * 
 * Before the media types are set, the only values that should be considered valid are the MFT_INPUT_STREAM_REMOVABLE and MFT_INPUT_STREAM_OPTIONAL flags in the <b>dwFlags</b> member.
 * 
 * <ul>
 * <li>
 * The MFT_INPUT_STREAM_REMOVABLE flag indicates that the stream can be deleted.
 * 
 * </li>
 * <li>
 * The MFT_INPUT_STREAM_OPTIONAL flag indicates that the stream is optional and does not require a media type.
 * 
 * </li>
 * </ul>
 * After you set a media type on all of the input and output streams (not including optional streams), all of the values returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getinputstreaminfo">GetInputStreamInfo</a> method are valid. They might change if you set different media types.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/ns-mftransform-mft_input_stream_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFT_INPUT_STREAM_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Maximum amount of time between an input sample and the corresponding output sample, in 100-nanosecond units. For example, an MFT that buffers two samples, each with a duration of 1 second, has a maximum latency of two seconds. If the MFT always turns input samples directly into output samples, with no buffering, the latency is zero.
     * @type {Integer}
     */
    hnsMaxLatency {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_input_stream_info_flags">_MFT_INPUT_STREAM_INFO_FLAGS</a> enumeration.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The minimum size of each input buffer, in bytes. If the size is variable or the MFT does not require a specific size, the value is zero. For uncompressed audio, the value should be the audio frame size, which you can get from the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-block-alignment-attribute">MF_MT_AUDIO_BLOCK_ALIGNMENT</a> attribute in the media type.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Maximum amount of input data, in bytes, that the MFT holds to perform lookahead. <i>Lookahead</i> is the action of looking forward in the data before processing it. This value should be the worst-case value. If the MFT does not keep a lookahead buffer, the value is zero.
     * @type {Integer}
     */
    cbMaxLookahead {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The memory alignment required for input buffers. If the MFT does not require a specific alignment, the value is zero.
     * @type {Integer}
     */
    cbAlignment {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
