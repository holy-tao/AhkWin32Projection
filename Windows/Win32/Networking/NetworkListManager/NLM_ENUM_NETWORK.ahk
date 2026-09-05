#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NLM_ENUM_NETWORK enumeration contains a set of flags that specify what types of networks are enumerated.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_enum_network
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
class NLM_ENUM_NETWORK extends Win32Enum {

    /**
     * Returns connected networks
     * Native name: NLM_ENUM_NETWORK_CONNECTED
     * @type {Integer (Int32)}
     */
    static CONNECTED => 1

    /**
     * Returns disconnected networks
     * Native name: NLM_ENUM_NETWORK_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 2

    /**
     * Returns connected and disconnected networks
     * Native name: NLM_ENUM_NETWORK_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 3
}
