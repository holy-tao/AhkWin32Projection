#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FT_STATE_EVENT_CAUSE enum indicates the type of file terminal event.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-ft_state_event_cause
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct FT_STATE_EVENT_CAUSE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * State change in response to a normal API call.
     * @type {Integer (Int32)}
     */
    static FTEC_NORMAL => 0

    /**
     * Storage EOF reached on playback.
     * @type {Integer (Int32)}
     */
    static FTEC_END_OF_FILE => 1

    /**
     * Storage read error on playback.
     * @type {Integer (Int32)}
     */
    static FTEC_READ_ERROR => 2

    /**
     * Storage write error on the record.
     * @type {Integer (Int32)}
     */
    static FTEC_WRITE_ERROR => 3
}
