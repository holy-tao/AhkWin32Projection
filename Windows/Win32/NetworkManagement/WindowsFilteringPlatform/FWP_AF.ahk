#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FWP_AF enumerated type.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_af
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_AF {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies an address as an IPv4 address.
     * @type {Integer (Int32)}
     */
    static FWP_AF_INET => 0

    /**
     * Specifies an address as an IPv6 address.
     * @type {Integer (Int32)}
     */
    static FWP_AF_INET6 => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static FWP_AF_ETHER => 2

    /**
     * Placeholder value to be used when the address family is not yet identified.
     * @type {Integer (Int32)}
     */
    static FWP_AF_NONE => 3
}
