#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FT_STATE_EVENT_CAUSE enum indicates the type of file terminal event.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-ft_state_event_cause
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class FT_STATE_EVENT_CAUSE extends Win32Enum{

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
