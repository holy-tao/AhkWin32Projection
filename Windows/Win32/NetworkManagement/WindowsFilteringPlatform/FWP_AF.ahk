#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FWP_AF enumerated type.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_af
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWP_AF extends Win32Enum {

    /**
     * Specifies an address as an IPv4 address.
     * Native name: FWP_AF_INET
     * @type {Integer (Int32)}
     */
    static INET => 0

    /**
     * Specifies an address as an IPv6 address.
     * Native name: FWP_AF_INET6
     * @type {Integer (Int32)}
     */
    static INET6 => 1

    /**
     * Reserved.
     * Native name: FWP_AF_ETHER
     * @type {Integer (Int32)}
     */
    static ETHER => 2

    /**
     * Placeholder value to be used when the address family is not yet identified.
     * Native name: FWP_AF_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 3
}
