#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores IPsec AH drop packet statistics.
 * @remarks
 * <b>IPSEC_AH_DROP_PACKET_STATISTICS0</b> is a specific implementation of IPSEC_AH_DROP_PACKET_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_ah_drop_packet_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_AH_DROP_PACKET_STATISTICS0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Number of invalid SPIs on inbound.
     * @type {Integer}
     */
    invalidSpisOnInbound {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of authentication failures on inbound.
     * @type {Integer}
     */
    authenticationFailuresOnInbound {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of replay check failures  on inbound.
     * @type {Integer}
     */
    replayCheckFailuresOnInbound {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of inbound drops for packets received on SAs that were not fully initialized.
     * @type {Integer}
     */
    saNotInitializedOnInbound {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
