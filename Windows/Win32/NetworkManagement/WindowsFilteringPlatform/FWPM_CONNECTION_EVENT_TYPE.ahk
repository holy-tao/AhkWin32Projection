#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of connection object change event.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_connection_event_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_CONNECTION_EVENT_TYPE extends Win32Enum {

    /**
     * A new connection object was added.
     * Native name: FWPM_CONNECTION_EVENT_ADD
     * @type {Integer (Int32)}
     */
    static ADD => 0

    /**
     * A connection object was deleted.
     * Native name: FWPM_CONNECTION_EVENT_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 1

    /**
     * Maximum value for testing purposes.
     * Native name: FWPM_CONNECTION_EVENT_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
