#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores the lifetime in seconds/kilobytes/packets for an IPsec security association (SA).
 * @remarks
 * 
 * <b>IPSEC_SA_LIFETIME0</b> is a specific implementation of IPSEC_SA_LIFETIME. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_sa_lifetime0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_LIFETIME0 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * SA lifetime in seconds.
     * @type {Integer}
     */
    lifetimeSeconds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * SA lifetime in kilobytes.
     * @type {Integer}
     */
    lifetimeKilobytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * SA lifetime in packets.
     * @type {Integer}
     */
    lifetimePackets {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
