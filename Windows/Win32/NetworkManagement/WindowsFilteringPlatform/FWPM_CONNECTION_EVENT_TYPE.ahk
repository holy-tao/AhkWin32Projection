#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of connection object change event.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_connection_event_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_CONNECTION_EVENT_TYPE{

    /**
     * A new connection object was added.
     * @type {Integer (Int32)}
     */
    static FWPM_CONNECTION_EVENT_ADD => 0

    /**
     * A connection object was deleted.
     * @type {Integer (Int32)}
     */
    static FWPM_CONNECTION_EVENT_DELETE => 1

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWPM_CONNECTION_EVENT_MAX => 2
}
