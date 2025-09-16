#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_WIRE_RECORD structure contains information about a DNS wire record transmitted across the network as specified in section 4.1.3 of RFC 1035.
 * @remarks
 * When constructing a DNS message, the <b>DNS_WIRE_RECORD</b> structure is immediately followed by the record data and is preceded by the DNS RR's domain name.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_wire_record
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_WIRE_RECORD extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A value that represents the RR <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Response Type</a>. <b>RecordType</b> determines the format of record data that follows the <b>DNS_WIRE_RECORD</b> structure. For example, if the value of <b>RecordType</b> is <b>DNS_TYPE_A</b>, the data type of record data  is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
     * @type {Integer}
     */
    RecordType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A value that represents the RR <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Class</a>.
     * @type {Integer}
     */
    RecordClass {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The DNS Resource Record's Time To Live value (TTL), in seconds.
     * @type {Integer}
     */
    TimeToLive {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The length, in bytes, of the DNS record data that follows the <b>DNS_WIRE_RECORD</b>.
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
