#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DMO_OUTPUT_STREAM_INFO_FLAGS enumeration defines flags that describe an output stream.
 * @remarks
 * The DMO_OUTPUT_STREAMF_DISCARDABLE and DMO_OUTPUT_STREAMF_OPTIONAL flags are mutually exclusive. The DMO can set one of these flags (or neither), but not both.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ne-mediaobj-_dmo_output_stream_info_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
class _DMO_OUTPUT_STREAM_INFO_FLAGS extends Win32Enum {

    /**
     * The stream contains whole samples. Samples do not span multiple buffers, and buffers do not contain partial samples.
     * Native name: DMO_OUTPUT_STREAMF_WHOLE_SAMPLES
     * @type {Integer (Int32)}
     */
    static STREAMF_WHOLE_SAMPLES => 1

    /**
     * Each buffer contains exactly one sample.
     * Native name: DMO_OUTPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER
     * @type {Integer (Int32)}
     */
    static STREAMF_SINGLE_SAMPLE_PER_BUFFER => 2

    /**
     * All the samples in this stream are the same size.
     * Native name: DMO_OUTPUT_STREAMF_FIXED_SAMPLE_SIZE
     * @type {Integer (Int32)}
     */
    static STREAMF_FIXED_SAMPLE_SIZE => 4

    /**
     * The stream is discardable. Within calls to <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processoutput">IMediaObject::ProcessOutput</a>, the DMO can discard data for this stream without copying it to an output buffer.
     * Native name: DMO_OUTPUT_STREAMF_DISCARDABLE
     * @type {Integer (Int32)}
     */
    static STREAMF_DISCARDABLE => 8

    /**
     * The stream is optional. An optional stream is discardable. Also, the application can ignore this stream entirely; it does not have to set the media type for the stream. Optional streams generally contain additional information, or data not needed by all applications.
     * Native name: DMO_OUTPUT_STREAMF_OPTIONAL
     * @type {Integer (Int32)}
     */
    static STREAMF_OPTIONAL => 16
}
