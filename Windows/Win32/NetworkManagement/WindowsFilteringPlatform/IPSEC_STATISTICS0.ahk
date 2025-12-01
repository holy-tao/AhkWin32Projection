#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_AGGREGATE_SA_STATISTICS0.ahk
#Include .\IPSEC_ESP_DROP_PACKET_STATISTICS0.ahk
#Include .\IPSEC_AH_DROP_PACKET_STATISTICS0.ahk
#Include .\IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0.ahk
#Include .\IPSEC_TRAFFIC_STATISTICS0.ahk

/**
 * Is the top-level of the IPsec statistics structures. (IPSEC_STATISTICS0)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_STATISTICS0 extends Win32Struct
{
    static sizeof => 208

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_aggregate_sa_statistics0">IPSEC_AGGREGATE_SA_STATISTICS0</a> structure containing IPsec aggregate SA statistics.
     * @type {IPSEC_AGGREGATE_SA_STATISTICS0}
     */
    aggregateSaStatistics{
        get {
            if(!this.HasProp("__aggregateSaStatistics"))
                this.__aggregateSaStatistics := IPSEC_AGGREGATE_SA_STATISTICS0(0, this)
            return this.__aggregateSaStatistics
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_esp_drop_packet_statistics0">IPSEC_ESP_DROP_PACKET_STATISTICS0</a> structure containing IPsec ESP drop packet statistics.
     * @type {IPSEC_ESP_DROP_PACKET_STATISTICS0}
     */
    espDropPacketStatistics{
        get {
            if(!this.HasProp("__espDropPacketStatistics"))
                this.__espDropPacketStatistics := IPSEC_ESP_DROP_PACKET_STATISTICS0(32, this)
            return this.__espDropPacketStatistics
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_ah_drop_packet_statistics0">IPSEC_AH_DROP_PACKET_STATISTICS0</a> structure containing IPsec AH drop packet statistics.
     * @type {IPSEC_AH_DROP_PACKET_STATISTICS0}
     */
    ahDropPacketStatistics{
        get {
            if(!this.HasProp("__ahDropPacketStatistics"))
                this.__ahDropPacketStatistics := IPSEC_AH_DROP_PACKET_STATISTICS0(56, this)
            return this.__ahDropPacketStatistics
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_aggregate_drop_packet_statistics0">IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0</a> structure containing IPsec aggregate drop packet statistics.
     * @type {IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0}
     */
    aggregateDropPacketStatistics{
        get {
            if(!this.HasProp("__aggregateDropPacketStatistics"))
                this.__aggregateDropPacketStatistics := IPSEC_AGGREGATE_DROP_PACKET_STATISTICS0(72, this)
            return this.__aggregateDropPacketStatistics
        }
    }

    /**
     * [IPSEC_TRAFFIC_STATISTICS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic_statistics0) structure containing IPsec inbound traffic statistics.
     * @type {IPSEC_TRAFFIC_STATISTICS0}
     */
    inboundTrafficStatistics{
        get {
            if(!this.HasProp("__inboundTrafficStatistics"))
                this.__inboundTrafficStatistics := IPSEC_TRAFFIC_STATISTICS0(112, this)
            return this.__inboundTrafficStatistics
        }
    }

    /**
     * [IPSEC_TRAFFIC_STATISTICS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic_statistics0) structure containing IPsec outbound traffic statistics.
     * @type {IPSEC_TRAFFIC_STATISTICS0}
     */
    outboundTrafficStatistics{
        get {
            if(!this.HasProp("__outboundTrafficStatistics"))
                this.__outboundTrafficStatistics := IPSEC_TRAFFIC_STATISTICS0(160, this)
            return this.__outboundTrafficStatistics
        }
    }
}
