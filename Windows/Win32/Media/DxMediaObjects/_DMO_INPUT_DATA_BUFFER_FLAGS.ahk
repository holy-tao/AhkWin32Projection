#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DMO_INPUT_DATA_BUFFER_FLAGS enumeration defines flags that describe an input buffer.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ne-mediaobj-_dmo_input_data_buffer_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class _DMO_INPUT_DATA_BUFFER_FLAGS extends Win32Enum{

    /**
     * The beginning of the data is a synchronization point.
     * @type {Integer (Int32)}
     */
    static DMO_INPUT_DATA_BUFFERF_SYNCPOINT => 1

    /**
     * The buffer's time stamp is valid.
     * 
     * The buffer's indicated time length is valid.
     * @type {Integer (Int32)}
     */
    static DMO_INPUT_DATA_BUFFERF_TIME => 2

    /**
     * The buffer's indicated time length is valid.
     * @type {Integer (Int32)}
     */
    static DMO_INPUT_DATA_BUFFERF_TIMELENGTH => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DMO_INPUT_DATA_BUFFERF_DISCONTINUITY => 8
}
