#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CALLHUB_EVENT enum describes CallHub events. The ITCallHubEvent::get_Event method returns a member of this enum to indicate the type of CallHub event that occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-callhub_event
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct CALLHUB_EVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A new call has joined the CallHub.
     * @type {Integer (Int32)}
     */
    static CHE_CALLJOIN => 0

    /**
     * A call has left the CallHub.
     * @type {Integer (Int32)}
     */
    static CHE_CALLLEAVE => 1

    /**
     * A new CallHub has appeared.
     * @type {Integer (Int32)}
     */
    static CHE_CALLHUBNEW => 2

    /**
     * A CallHub has gone idle.
     * @type {Integer (Int32)}
     */
    static CHE_CALLHUBIDLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static CHE_LASTITEM => 3
}
