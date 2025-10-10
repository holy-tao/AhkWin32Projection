#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A DNS_QUERY_RESULT structure contains the DNS query results returned from a call to DnsQueryEx.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_query_result
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_QUERY_RESULT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The structure version must be one of the following:
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The return status of the call to <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>. 
     * 
     * If the query was completed asynchronously and this structure was returned directly from <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>, <b>QueryStatus</b> contains <b>DNS_REQUEST_PENDING</b>.
     * 
     * If the query was completed synchronously or if this structure was returned by the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> DNS callback, <b>QueryStatus</b> contains ERROR_SUCCESS if successful or the appropriate DNS-specific error code as defined in Winerror.h.
     * @type {Integer}
     */
    QueryStatus {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Query  Options</a> that were used in the DNS query. Options can be combined and all options override <b>DNS_QUERY_STANDARD</b>
     * @type {Integer}
     */
    QueryOptions {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure.
     * 
     * If the query was completed asynchronously and this structure was returned directly from <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>, <b>pQueryRecords</b> is NULL.
     * 
     * If the query was completed synchronously or if this structure was returned by the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> DNS callback, <b>pQueryRecords</b> contains a list of Resource Records (RR) that comprise the response.
     * 
     * <div class="alert"><b>Note</b>  Applications must free returned RR sets with the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordlistfree">DnsRecordListFree</a> function.</div>
     * <div> </div>
     * @type {Pointer<DNS_RECORDA>}
     */
    pQueryRecords {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
