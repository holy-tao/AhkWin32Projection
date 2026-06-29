#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags for processing output samples in a Media Foundation transform (MFT).
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct _MFT_PROCESS_OUTPUT_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not produce output for streams in which the <b>pSample</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure is <b>NULL</b>. This flag is not valid unless the MFT has marked the output stream with the MFT_OUTPUT_STREAM_DISCARDABLE or MFT_OUTPUT_STREAM_LAZY_READ flag. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">IMFTransform::GetOutputStreamInfo</a>.
     * @type {Integer (Int32)}
     */
    static MFT_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER => 1

    /**
     * Regenerates the last output sample. This flag is only used by video processing MFTs.
     * 
     * <b>Note</b> Requires Windows 8.
     * @type {Integer (Int32)}
     */
    static MFT_PROCESS_OUTPUT_REGENERATE_LAST_OUTPUT => 2
}
