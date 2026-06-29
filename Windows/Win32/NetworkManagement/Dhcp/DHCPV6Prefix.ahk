#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\StatusCode.ahk" { StatusCode }

/**
 * The DHCPV6Prefix contains an IPv6 prefix.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefix
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6Prefix {
    #StructPack 4

    /**
     * 128 bit prefix.
     */
    prefix : Int8[16]

    /**
     * Length of the prefix.
     */
    prefixLength : UInt32

    /**
     * Preferred lifetime of the prefix, in seconds.
     */
    preferredLifeTime : UInt32

    /**
     * The valid lifetime of the prefix in seconds.
     */
    validLifeTime : UInt32

    /**
     * The status code returned.
     */
    status : StatusCode

}
