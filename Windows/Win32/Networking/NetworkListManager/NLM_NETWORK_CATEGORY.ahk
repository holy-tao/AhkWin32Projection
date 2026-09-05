#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NLM_NETWORK_CATEGORY enumeration is a set of flags that specify the category type of a network.
 * @remarks
 * The private or public network categories must never be used to assume which Windows Firewall ports are open, as the user can change the default settings of these categories. Instead, Firewall APIs should be called to ensure the ports that the required ports are open.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_network_category
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
class NLM_NETWORK_CATEGORY extends Win32Enum {

    /**
     * The network is a public (untrusted) network.
     * Native name: NLM_NETWORK_CATEGORY_PUBLIC
     * @type {Integer (Int32)}
     */
    static PUBLIC => 0

    /**
     * The network is a private (trusted) network.
     * Native name: NLM_NETWORK_CATEGORY_PRIVATE
     * @type {Integer (Int32)}
     */
    static PRIVATE => 1

    /**
     * The network is authenticated against an Active Directory domain.
     * Native name: NLM_NETWORK_CATEGORY_DOMAIN_AUTHENTICATED
     * @type {Integer (Int32)}
     */
    static DOMAIN_AUTHENTICATED => 2
}
