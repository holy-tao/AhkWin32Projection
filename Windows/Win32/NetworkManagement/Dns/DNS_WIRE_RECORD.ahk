#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_WIRE_RECORD structure contains information about a DNS wire record transmitted across the network as specified in section 4.1.3 of RFC 1035.
 * @remarks
 * When constructing a DNS message, the <b>DNS_WIRE_RECORD</b> structure is immediately followed by the record data and is preceded by the DNS RR's domain name.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_wire_record
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_WIRE_RECORD {
    #StructPack 4

    /**
     * A value that represents the RR <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Response Type</a>. <b>RecordType</b> determines the format of record data that follows the <b>DNS_WIRE_RECORD</b> structure. For example, if the value of <b>RecordType</b> is <b>DNS_TYPE_A</b>, the data type of record data  is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
     */
    RecordType : UInt16

    /**
     * A value that represents the RR <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Class</a>.
     */
    RecordClass : UInt16

    /**
     * The DNS Resource Record's Time To Live value (TTL), in seconds.
     */
    TimeToLive : UInt32

    /**
     * The length, in bytes, of the DNS record data that follows the <b>DNS_WIRE_RECORD</b>.
     */
    DataLength : UInt16

}
