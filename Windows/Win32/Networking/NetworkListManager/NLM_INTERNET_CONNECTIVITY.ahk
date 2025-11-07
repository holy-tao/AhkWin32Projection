#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NLM_INTERNET_CONNECTIVITY enumeration defines a set of flags that provide additional data for IPv4 or IPv6 network connectivity.
 * @remarks
 * 
 * These connectivity flags can be retrieved by querying  for the <i>NA_InternetConnectivityV4</i> or <i>NA_InternetConnectivityV6</i> properties using the <b>IPropertyBag</b> interface for an <a href="https://docs.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetwork">INetwork</a> or <a href="https://docs.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworkconnection">INetworkConnection</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/ne-netlistmgr-nlm_internet_connectivity
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_INTERNET_CONNECTIVITY{

    /**
     * Indicates that the detected network is a hotspot. For example, when connected to a coffee Wi-Fi hotspot network and the local HTTP traffic is being redirected to a captive portal, this flag will be set.
     * @type {Integer (Int32)}
     */
    static NLM_INTERNET_CONNECTIVITY_WEBHIJACK => 1

    /**
     * Indicates that the detected network has a proxy configuration. For example, when connected to a corporate network using a proxy for HTTP access, this flag will be set.
     * @type {Integer (Int32)}
     */
    static NLM_INTERNET_CONNECTIVITY_PROXIED => 2

    /**
     * Indicates that the machine is configured for Direct Access and that access to the corporate domain network, for which Direct Access was previously configured, has been detected.
     * @type {Integer (Int32)}
     */
    static NLM_INTERNET_CONNECTIVITY_CORPORATE => 4
}
