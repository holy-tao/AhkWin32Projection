#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store mobile additional address information.
 * @remarks
 * <b>IPSEC_ADDRESS_INFO0</b> is a specific implementation of IPSEC_ADDRESS_INFO. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_address_info0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_ADDRESS_INFO0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of IPv4 addresses stored in the <b>v4Addresses</b> member.
     * @type {Integer}
     */
    numV4Addresses {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of IPv4 local addresses to indicate to peer.
     * @type {Pointer<Integer>}
     */
    v4Addresses {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of IPv6 addresses stored in the <b>v6Addresses</b> member.
     * @type {Integer}
     */
    numV6Addresses {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of IPv6 local addresses to indicate to peer.
     * @type {Pointer<FWP_BYTE_ARRAY16>}
     */
    v6Addresses {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
