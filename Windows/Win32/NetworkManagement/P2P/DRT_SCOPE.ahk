#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRT_SCOPE enumeration defines the set of IPv6 scopes in which DRT operates while using the IPv6 UDP transport created by DrtCreateIpv6UdpTransport.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ne-drt-drt_scope
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_SCOPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Uses the global scope.
     * @type {Integer (Int32)}
     */
    static DRT_GLOBAL_SCOPE => 1

    /**
     * The <b>DRT_SITE_LOCAL_SCOPE</b> has been deprecated and should not be used.
     * @type {Integer (Int32)}
     */
    static DRT_SITE_LOCAL_SCOPE => 2

    /**
     * Uses the link local scope.
     * @type {Integer (Int32)}
     */
    static DRT_LINK_LOCAL_SCOPE => 3
}
