#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates a type of service status change for monitoring and reporting.
 * @see https://learn.microsoft.com/windows/win32/Services/sc-event-type
 * @namespace Windows.Win32.System.Services
 */
export default struct SC_EVENT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static SC_EVENT_DATABASE_CHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SC_EVENT_PROPERTY_CHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SC_EVENT_STATUS_CHANGE => 2
}
