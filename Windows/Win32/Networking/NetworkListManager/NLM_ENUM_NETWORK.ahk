#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NLM_ENUM_NETWORK enumeration contains a set of flags that specify what types of networks are enumerated.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_enum_network
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_ENUM_NETWORK{

    /**
     * Returns connected networks
     * @type {Integer (Int32)}
     */
    static NLM_ENUM_NETWORK_CONNECTED => 1

    /**
     * Returns disconnected networks
     * @type {Integer (Int32)}
     */
    static NLM_ENUM_NETWORK_DISCONNECTED => 2

    /**
     * Returns connected and disconnected networks
     * @type {Integer (Int32)}
     */
    static NLM_ENUM_NETWORK_ALL => 3
}
