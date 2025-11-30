#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DNS_FREE_TYPE enumeration specifies the type of data to free.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ne-windns-dns_free_type
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_FREE_TYPE extends Win32Enum{

    /**
     * The data freed is a flat structure.
     * @type {Integer (Int32)}
     */
    static DnsFreeFlat => 0

    /**
     * The data freed is a Resource Record list, and includes subfields of the <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure. Resources freed include structures returned by the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsquery_a">DnsQuery</a> and <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordsetcopyex">DnsRecordSetCopyEx</a> functions.
     * @type {Integer (Int32)}
     */
    static DnsFreeRecordList => 1

    /**
     * The data freed is a parsed message field.
     * @type {Integer (Int32)}
     */
    static DnsFreeParsedMessageFields => 2
}
