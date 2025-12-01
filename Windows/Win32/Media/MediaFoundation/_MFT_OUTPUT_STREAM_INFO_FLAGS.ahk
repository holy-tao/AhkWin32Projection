#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes an output stream on a Media Foundation transform (MFT).
 * @remarks
 * Before the client sets the media types on the MFT, the only flag guaranteed to be accurate is the MFT_OUTPUT_STREAM_OPTIONAL flag. For all other flags, the client should first set the media type on every non-optional stream.
 * 
 * The MFT_OUTPUT_STREAM_DISCARDABLE and MFT_OUTPUT_STREAM_LAZY_READ flags define different behaviors for how the MFT can discard output data.
 * 
 * <ul>
 * <li>
 * MFT_OUTPUT_STREAM_DISCARDABLE: The MFT discards output data only if the client calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> with the MFT_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER flag. The MFT never discards data when the client calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">ProcessInput</a>.
 * 
 * </li>
 * <li>
 * MFT_OUTPUT_STREAM_LAZY_READ: If the client continues to call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">ProcessInput</a> without collecting the output from this stream, the MFT eventually discards the output. If all output streams have the MFT_OUTPUT_STREAM_LAZY_READ flag, the MFT never refuses more input data.
 * 
 * </li>
 * </ul>
 * If neither of these flags is set, the MFT never discards output data.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_output_stream_info_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class _MFT_OUTPUT_STREAM_INFO_FLAGS extends Win32Enum{

    /**
     * Each media sample (<a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface) of output data from the MFT contains complete, unbroken units of data. The definition of a <i>unit of data</i> depends on the media type: For uncompressed video, a video frame; for compressed data, a compressed packet; for uncompressed audio, a single audio frame.
     * 
     * For uncompressed audio formats, this flag is always implied. (It is valid to set the flag, but not required.) An uncompressed audio frame should never span more than one media sample.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STREAM_WHOLE_SAMPLES => 1

    /**
     * Each output sample contains exactly one unit of data, as defined for the MFT_OUTPUT_STREAM_WHOLE_SAMPLES flag.
     * 
     * If this flag is present, the MFT_OUTPUT_STREAM_WHOLE_SAMPLES flag must also be present.
     * 
     * An MFT that outputs uncompressed audio should not set this flag. For efficiency, it should output more than one audio frame at a time.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STREAM_SINGLE_SAMPLE_PER_BUFFER => 2

    /**
     * All output samples are the same size.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STREAM_FIXED_SAMPLE_SIZE => 4

    /**
     * The MFT can discard the output data from this output stream, if requested by the client. To discard the output, set the MFT_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER flag in the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a> method.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STREAM_DISCARDABLE => 8

    /**
     * This output stream is optional. The client can deselect the stream by not setting a media type or by setting a <b>NULL</b> media type. When an optional stream is deselected, it does not produce any output data.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STREAM_OPTIONAL => 16

    /**
     * The MFT provides the output samples for this stream, either by allocating them internally or by operating directly on the input samples. The MFT cannot use output samples provided by the client for this stream.
     * 
     * If this flag is not set, the MFT must set <b>cbSize</b> to a nonzero value in the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_stream_info">MFT_OUTPUT_STREAM_INFO</a> structure, so that the client can allocate the correct buffer size. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">IMFTransform::GetOutputStreamInfo</a>. This flag cannot be combined with the MFT_OUTPUT_STREAM_CAN_PROVIDE_SAMPLES flag.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STREAM_PROVIDES_SAMPLES => 256

    /**
     * The MFT can either provide output samples for this stream or it can use samples that the client allocates. This flag cannot be combined with the MFT_OUTPUT_STREAM_PROVIDES_SAMPLES flag.
     * 
     * If the MFT does not set this flag or the MFT_OUTPUT_STREAM_PROVIDES_SAMPLES flag, the client must allocate the samples for this output stream. The MFT will not provide its own samples.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STREAM_CAN_PROVIDE_SAMPLES => 512

    /**
     * The MFT does not require the client to process the output for this stream. If the client continues to send input data without getting the output from this stream, the MFT simply discards the previous input.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STREAM_LAZY_READ => 1024

    /**
     * The MFT might remove this output stream during streaming. This flag typically applies to demultiplexers, where the input data contains multiple streams that can start and stop during streaming. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a>.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STREAM_REMOVABLE => 2048
}
