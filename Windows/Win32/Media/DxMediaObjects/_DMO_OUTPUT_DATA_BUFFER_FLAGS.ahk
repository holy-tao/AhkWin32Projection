#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DMO_OUTPUT_DATA_BUFFER_FLAGS enumeration defines flags that describe an output buffer.
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/ne-mediaobj-_dmo_output_data_buffer_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class _DMO_OUTPUT_DATA_BUFFER_FLAGS extends Win32Enum{

    /**
     * The beginning of the data is a synchronization point.
     *           A <i>synchronization point</i> is a random access point. For encoded video, this a sample that can be used as a decoding start point (key frame). For uncompressed audio or video, every sample is a synchronization point.
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_DATA_BUFFERF_SYNCPOINT => 1

    /**
     * The buffer's time stamp is valid.
     * 
     * The buffer's indicated time length is valid.
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_DATA_BUFFERF_TIME => 2

    /**
     * The buffer's indicated time length is valid.
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_DATA_BUFFERF_TIMELENGTH => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_DATA_BUFFERF_DISCONTINUITY => 8

    /**
     * There is still input data available for processing, but the output buffer is full.
     * @type {Integer (Int32)}
     */
    static DMO_OUTPUT_DATA_BUFFERF_INCOMPLETE => 16777216
}
