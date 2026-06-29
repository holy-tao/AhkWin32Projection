#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DMO_INPUT_DATA_BUFFER_FLAGS enumeration defines flags that describe an input buffer.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ne-mediaobj-_dmo_input_data_buffer_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
export default struct _DMO_INPUT_DATA_BUFFER_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static DMO_INPUT_DATA_BUFFERF_DISCONTINUITY => 8
}
