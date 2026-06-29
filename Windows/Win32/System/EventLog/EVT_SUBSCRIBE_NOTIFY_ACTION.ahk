#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible types of data that the subscription service can deliver to your callback.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_subscribe_notify_action
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_SUBSCRIBE_NOTIFY_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the <i>Event</i> parameter contains a Win32 error code.
     * @type {Integer (Int32)}
     */
    static EvtSubscribeActionError => 0

    /**
     * Indicates that the <i>Event</i> parameter contains an event that matches the subscriber's query.
     * @type {Integer (Int32)}
     */
    static EvtSubscribeActionDeliver => 1
}
