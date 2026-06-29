#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_AGGREGATE_SA_STATISTICS0.ahk" { IPSEC_AGGREGATE_SA_STATISTICS0 }
#Import ".\IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0.ahk" { IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0 }
#Import ".\IPSEC_ESP_DROP_PACKET_STATISTICS0.ahk" { IPSEC_ESP_DROP_PACKET_STATISTICS0 }
#Import ".\IPSEC_AH_DROP_PACKET_STATISTICS0.ahk" { IPSEC_AH_DROP_PACKET_STATISTICS0 }
#Import ".\IPSEC_TRAFFIC_STATISTICS0.ahk" { IPSEC_TRAFFIC_STATISTICS0 }

/**
 * Is the top-level of the IPsec statistics structures. (IPSEC_STATISTICS0)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_STATISTICS0 {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_aggregate_sa_statistics0">IPSEC_AGGREGATE_SA_STATISTICS0</a> structure containing IPsec aggregate SA statistics.
     */
    aggregateSaStatistics : IPSEC_AGGREGATE_SA_STATISTICS0

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_esp_drop_packet_statistics0">IPSEC_ESP_DROP_PACKET_STATISTICS0</a> structure containing IPsec ESP drop packet statistics.
     */
    espDropPacketStatistics : IPSEC_ESP_DROP_PACKET_STATISTICS0

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_ah_drop_packet_statistics0">IPSEC_AH_DROP_PACKET_STATISTICS0</a> structure containing IPsec AH drop packet statistics.
     */
    ahDropPacketStatistics : IPSEC_AH_DROP_PACKET_STATISTICS0

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_aggregate_drop_packet_statistics0">IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0</a> structure containing IPsec aggregate drop packet statistics.
     */
    aggregateDropPacketStatistics : IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0

    /**
     * [IPSEC_TRAFFIC_STATISTICS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic_statistics0) structure containing IPsec inbound traffic statistics.
     */
    inboundTrafficStatistics : IPSEC_TRAFFIC_STATISTICS0

    /**
     * [IPSEC_TRAFFIC_STATISTICS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic_statistics0) structure containing IPsec outbound traffic statistics.
     */
    outboundTrafficStatistics : IPSEC_TRAFFIC_STATISTICS0

}
