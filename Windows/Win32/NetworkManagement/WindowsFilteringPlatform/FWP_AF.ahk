#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FWP_AF enumerated type.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_af
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_AF extends Win32Enum{

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
