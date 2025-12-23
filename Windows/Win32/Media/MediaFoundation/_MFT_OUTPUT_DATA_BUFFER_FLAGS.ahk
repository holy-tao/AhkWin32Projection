#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines flags for the IMFTransform::ProcessOutput method.
 * @remarks
 * The values in this enumeration are not bit flags, so they should not be combined with a bitwise <b>OR</b>. Also, the caller should test for these flags with the equality operator, not a bitwise <b>AND</b>:
 * 
 * 
 * ``` syntax
 * // Correct.
 * if (Buffer.dwStatus == MFT_OUTPUT_DATA_BUFFER_STREAM_END)
 * {
 *     ...
 * }
 * 
 * // Incorrect.
 * if ((Buffer.dwStatus & MFT_OUTPUT_DATA_BUFFER_STREAM_END) != 0)
 * {
 *     ...
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_output_data_buffer_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class _MFT_OUTPUT_DATA_BUFFER_FLAGS extends Win32Enum{

    /**
     * The MFT can still generate output from this stream without receiving any more input. Call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> again to process the next batch of input data.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_DATA_BUFFER_INCOMPLETE => 16777216

    /**
     * The format has changed on this output stream, or there is a new preferred format for this stream. When this flag is set, the MFT clears the media type for the stream. The <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> method returns MF_E_TRANSFORM_STREAM_CHANGE and generates no output for any stream. Further calls to <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">IMFTransform::ProcessInput</a> or <b>ProcessOutput</b> will fail until the client sets a new media type.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_DATA_BUFFER_FORMAT_CHANGE => 256

    /**
     * The MFT has removed this output stream. The output stream must have the MFT_OUTPUT_STREAM_REMOVABLE flag. (See <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">IMFTransform::GetOutputStreamInfo</a>.)
     * 
     * When the MFT removes an output stream, the MFT returns this status code on the next call to <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> after the last output sample has been produced. When the MFT returns this status code, it does not modify any sample contained in the <b>pSample</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure, nor does it allocate a new sample if <b>pSample</b> is <b>NULL</b>.
     * 
     * After this status code is returned, the stream identifier for this output stream is no longer valid. The client should no longer provide an <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure for that stream when it calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> method does not return <b>MF_E_TRANSFORM_STREAM_CHANGE</b> when a stream ends, unless there is a change in another stream that requires this return code.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_DATA_BUFFER_STREAM_END => 512

    /**
     * There is no sample ready for this stream. This flag might be set if the MFT has multiple output streams that produce data at different times. It sets this flag for each stream that is not ready to produce data. It does not modify the output sample contained in the <b>pSample</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure, nor does it allocate a new sample is <b>pSample</b> is <b>NULL</b>.
     * 
     * If no streams are ready to produce output, the MFT does not set this flag. Instead, the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> method returns MF_E_TRANSFORM_NEED_MORE_INPUT.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_DATA_BUFFER_NO_SAMPLE => 768
}
