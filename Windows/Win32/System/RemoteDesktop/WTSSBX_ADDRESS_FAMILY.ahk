#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the address family of a network address that is being used for redirection.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_address_family
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_ADDRESS_FAMILY extends Win32Enum{

    /**
     * An unspecified address family.
     * @type {Integer (Int32)}
     */
    static WTSSBX_ADDRESS_FAMILY_AF_UNSPEC => 0

    /**
     * An IPv4 address.
     * @type {Integer (Int32)}
     */
    static WTSSBX_ADDRESS_FAMILY_AF_INET => 1

    /**
     * An IPv6 address.
     * @type {Integer (Int32)}
     */
    static WTSSBX_ADDRESS_FAMILY_AF_INET6 => 2

    /**
     * An IPX address.
     * @type {Integer (Int32)}
     */
    static WTSSBX_ADDRESS_FAMILY_AF_IPX => 3

    /**
     * A NetBIOS address.
     * @type {Integer (Int32)}
     */
    static WTSSBX_ADDRESS_FAMILY_AF_NETBIOS => 4
}
