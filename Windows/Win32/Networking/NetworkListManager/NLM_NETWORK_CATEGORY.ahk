#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NLM_NETWORK_CATEGORY enumeration is a set of flags that specify the category type of a network.
 * @remarks
 * The private or public network categories must never be used to assume which Windows Firewall ports are open, as the user can change the default settings of these categories. Instead, Firewall APIs should be called to ensure the ports that the required ports are open.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_network_category
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_NETWORK_CATEGORY{

    /**
     * The network is a public (untrusted) network.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_CATEGORY_PUBLIC => 0

    /**
     * The network is a private (trusted) network.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_CATEGORY_PRIVATE => 1

    /**
     * The network is authenticated against an Active Directory domain.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_CATEGORY_DOMAIN_AUTHENTICATED => 2
}
