#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores IPsec AH drop packet statistics.
 * @remarks
 * <b>IPSEC_AH_DROP_PACKET_STATISTICS0</b> is a specific implementation of IPSEC_AH_DROP_PACKET_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_ah_drop_packet_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_AH_DROP_PACKET_STATISTICS0 {
    #StructPack 4

    /**
     * Number of invalid SPIs on inbound.
     */
    invalidSpisOnInbound : UInt32

    /**
     * Number of authentication failures on inbound.
     */
    authenticationFailuresOnInbound : UInt32

    /**
     * Number of replay check failures  on inbound.
     */
    replayCheckFailuresOnInbound : UInt32

    /**
     * Number of inbound drops for packets received on SAs that were not fully initialized.
     */
    saNotInitializedOnInbound : UInt32

}
