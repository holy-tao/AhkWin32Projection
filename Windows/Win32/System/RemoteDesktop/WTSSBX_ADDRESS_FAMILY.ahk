#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate the address family of a network address that is being used for redirection.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_address_family
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSBX_ADDRESS_FAMILY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
