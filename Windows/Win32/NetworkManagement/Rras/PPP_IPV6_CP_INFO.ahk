#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the result of an IPv6 control protocol negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_ipv6_cp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_IPV6_CP_INFO {
    #StructPack 4

    /**
     * The version of the <b>PPP_IPV6_CP_INFO</b> structure used.
     */
    dwVersion : UInt32

    /**
     * The size, in bytes, of this <b>PPP_IPV6_CP_INFO</b> structure.
     */
    dwSize : UInt32

    /**
     * Specifies the result of the PPP control protocol negotiation. A value of zero indicates success. A nonzero value indicates failure, and is the actual fatal error that occurred during the control protocol negotiation.
     */
    dwError : UInt32

    /**
     * Specifies the 64 bit interface identifier of the IPv6 server interface.
     */
    bInterfaceIdentifier : Int8[8]

    /**
     * Specifies the 64 bit interface identifier of the IPv6 client interface.
     */
    bRemoteInterfaceIdentifier : Int8[8]

    /**
     * Reserved. Must be set to 0.
     */
    dwOptions : UInt32

    /**
     * Reserved. Must be set to 0.
     */
    dwRemoteOptions : UInt32

    /**
     * Specifies the address prefix of the IPv6 client interface.
     */
    bPrefix : Int8[8]

    /**
     * The length, in bits, of the address prefix.
     */
    dwPrefixLength : UInt32

}
