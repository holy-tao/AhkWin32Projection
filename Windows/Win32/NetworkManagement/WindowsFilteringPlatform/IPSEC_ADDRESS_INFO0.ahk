#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }

/**
 * Is used to store mobile additional address information.
 * @remarks
 * <b>IPSEC_ADDRESS_INFO0</b> is a specific implementation of IPSEC_ADDRESS_INFO. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_address_info0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_ADDRESS_INFO0 {
    #StructPack 8

    /**
     * The number of IPv4 addresses stored in the <b>v4Addresses</b> member.
     */
    numV4Addresses : UInt32

    /**
     * Array of IPv4 local addresses to indicate to peer.
     */
    v4Addresses : IntPtr

    /**
     * The number of IPv6 addresses stored in the <b>v6Addresses</b> member.
     */
    numV6Addresses : UInt32

    /**
     * Array of IPv6 local addresses to indicate to peer.
     */
    v6Addresses : FWP_BYTE_ARRAY16.Ptr

}
