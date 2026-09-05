#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the address family of a network address that is being used for redirection.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_address_family
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTSSBX_ADDRESS_FAMILY extends Win32Enum {

    /**
     * An unspecified address family.
     * Native name: WTSSBX_ADDRESS_FAMILY_AF_UNSPEC
     * @type {Integer (Int32)}
     */
    static AF_UNSPEC => 0

    /**
     * An IPv4 address.
     * Native name: WTSSBX_ADDRESS_FAMILY_AF_INET
     * @type {Integer (Int32)}
     */
    static AF_INET => 1

    /**
     * An IPv6 address.
     * Native name: WTSSBX_ADDRESS_FAMILY_AF_INET6
     * @type {Integer (Int32)}
     */
    static AF_INET6 => 2

    /**
     * An IPX address.
     * Native name: WTSSBX_ADDRESS_FAMILY_AF_IPX
     * @type {Integer (Int32)}
     */
    static AF_IPX => 3

    /**
     * A NetBIOS address.
     * Native name: WTSSBX_ADDRESS_FAMILY_AF_NETBIOS
     * @type {Integer (Int32)}
     */
    static AF_NETBIOS => 4
}
