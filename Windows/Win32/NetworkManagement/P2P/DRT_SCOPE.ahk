#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DRT_SCOPE enumeration defines the set of IPv6 scopes in which DRT operates while using the IPv6 UDP transport created by DrtCreateIpv6UdpTransport.
 * @see https://docs.microsoft.com/windows/win32/api//drt/ne-drt-drt_scope
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_SCOPE extends Win32Enum{

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
