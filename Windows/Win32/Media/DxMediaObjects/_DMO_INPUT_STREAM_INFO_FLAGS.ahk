#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DMO_INPUT_STREAM_INFO_FLAGS enumeration defines flags that describe an input stream.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ne-mediaobj-_dmo_input_stream_info_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
class _DMO_INPUT_STREAM_INFO_FLAGS extends Win32Enum {

    /**
     * The stream requires whole samples. Samples must not span multiple buffers, and buffers must not contain partial samples.
     * Native name: DMO_INPUT_STREAMF_WHOLE_SAMPLES
     * @type {Integer (Int32)}
     */
    static STREAMF_WHOLE_SAMPLES => 1

    /**
     * Each buffer must contain exactly one sample.
     * Native name: DMO_INPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER
     * @type {Integer (Int32)}
     */
    static STREAMF_SINGLE_SAMPLE_PER_BUFFER => 2

    /**
     * All the samples in this stream must be the same size.
     * Native name: DMO_INPUT_STREAMF_FIXED_SAMPLE_SIZE
     * @type {Integer (Int32)}
     */
    static STREAMF_FIXED_SAMPLE_SIZE => 4

    /**
     * The DMO performs lookahead on the incoming data, and may hold multiple input buffers for this stream.
     * Native name: DMO_INPUT_STREAMF_HOLDS_BUFFERS
     * @type {Integer (Int32)}
     */
    static STREAMF_HOLDS_BUFFERS => 8
}
