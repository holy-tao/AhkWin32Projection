#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores aggregate IPsec kernel packet drop statistics.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_aggregate_drop_packet_statistics1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_AGGREGATE_DROP_PACKET_STATISTICS1 {
    #StructPack 4

    /**
     * Number of invalid SPIs on inbound.
     */
    invalidSpisOnInbound : UInt32

    /**
     * Number of decryption failures on inbound.
     */
    decryptionFailuresOnInbound : UInt32

    /**
     * Number of authentication failures on inbound.
     */
    authenticationFailuresOnInbound : UInt32

    /**
     * Number of UDP ESP validation failures on inbound.
     */
    udpEspValidationFailuresOnInbound : UInt32

    /**
     * Number of replay check failures on inbound.
     */
    replayCheckFailuresOnInbound : UInt32

    /**
     * Number of invalid clear text instances on inbound.
     */
    invalidClearTextInbound : UInt32

    /**
     * Number of inbound drops for packets received on SAs that were not fully initialized.
     */
    saNotInitializedOnInbound : UInt32

    /**
     * Number of inbound drops for packets received on SAs whose characteristics did not match the packet.
     */
    receiveOverIncorrectSaInbound : UInt32

    /**
     * Number of inbound IPsec secured packets that did not match any inbound IPsec transport layer filter.
     */
    secureReceivesNotMatchingFilters : UInt32

    /**
     * Number of inbound drops for all packets.
     */
    totalDropPacketsInbound : UInt32

}
