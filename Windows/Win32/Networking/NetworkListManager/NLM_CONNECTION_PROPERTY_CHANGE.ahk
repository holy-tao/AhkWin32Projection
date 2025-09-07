#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NLM_CONNECTION PROPERTY_CHANGE enumeration is a set of flags that define changes made to the properties of a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_connection_property_change
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_CONNECTION_PROPERTY_CHANGE{

    /**
     * The Authentication (Domain Type) of this Network Connection has changed.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_PROPERTY_CHANGE_AUTHENTICATION => 1
}
