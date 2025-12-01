#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NLM_Connectivity enumeration is a set of flags that provide notification whenever connectivity related parameters have changed.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_connectivity
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_CONNECTIVITY extends Win32Enum{

    /**
     * The underlying network interfaces have no connectivity to any network.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTIVITY_DISCONNECTED => 0

    /**
     * There is connectivity to a network, but the service cannot detect any IPv4 Network Traffic.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTIVITY_IPV4_NOTRAFFIC => 1

    /**
     * There is connectivity to a network, but the service cannot detect any IPv6 Network Traffic.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTIVITY_IPV6_NOTRAFFIC => 2

    /**
     * There is connectivity to the local subnet using the IPv4 protocol.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTIVITY_IPV4_SUBNET => 16

    /**
     * There is connectivity to a routed network using the IPv4 protocol.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTIVITY_IPV4_LOCALNETWORK => 32

    /**
     * There is connectivity to the Internet using the IPv4 protocol.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTIVITY_IPV4_INTERNET => 64

    /**
     * There is connectivity to the local subnet using the IPv6 protocol.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTIVITY_IPV6_SUBNET => 256

    /**
     * There is connectivity to a local network using the IPv6 protocol.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTIVITY_IPV6_LOCALNETWORK => 512

    /**
     * There is connectivity to the Internet using the IPv6 protocol.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTIVITY_IPV6_INTERNET => 1024
}
