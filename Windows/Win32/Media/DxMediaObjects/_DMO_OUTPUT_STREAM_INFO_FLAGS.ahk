#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DMO_OUTPUT_STREAM_INFO_FLAGS enumeration defines flags that describe an output stream.
 * @remarks
 * 
 * The DMO_OUTPUT_STREAMF_DISCARDABLE and DMO_OUTPUT_STREAMF_OPTIONAL flags are mutually exclusive. The DMO can set one of these flags (or neither), but not both.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/ne-mediaobj-_dmo_output_stream_info_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class _DMO_OUTPUT_STREAM_INFO_FLAGS{

    /**
     * The stream contains whole samples. Samples do not span multiple buffers, and buffers do not contain partial samples.
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_STREAMF_WHOLE_SAMPLES => 1

    /**
     * Each buffer contains exactly one sample.
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER => 2

    /**
     * All the samples in this stream are the same size.
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_STREAMF_FIXED_SAMPLE_SIZE => 4

    /**
     * The stream is discardable. Within calls to <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processoutput">IMediaObject::ProcessOutput</a>, the DMO can discard data for this stream without copying it to an output buffer.
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_STREAMF_DISCARDABLE => 8

    /**
     * The stream is optional. An optional stream is discardable. Also, the application can ignore this stream entirely; it does not have to set the media type for the stream. Optional streams generally contain additional information, or data not needed by all applications.
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_STREAMF_OPTIONAL => 16
}
