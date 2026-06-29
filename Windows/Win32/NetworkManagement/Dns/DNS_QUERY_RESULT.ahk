#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_RECORDA.ahk" { DNS_RECORDA }

/**
 * A DNS_QUERY_RESULT structure contains the DNS query results returned from a call to DnsQueryEx.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_query_result
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_QUERY_RESULT {
    #StructPack 8

    /**
     * The structure version must be one of the following:
     */
    Version : UInt32

    /**
     * The return status of the call to <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>. 
     * 
     * If the query was completed asynchronously and this structure was returned directly from <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>, <b>QueryStatus</b> contains <b>DNS_REQUEST_PENDING</b>.
     * 
     * If the query was completed synchronously or if this structure was returned by the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> DNS callback, <b>QueryStatus</b> contains ERROR_SUCCESS if successful or the appropriate DNS-specific error code as defined in Winerror.h.
     */
    QueryStatus : Int32

    /**
     * A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Query  Options</a> that were used in the DNS query. Options can be combined and all options override <b>DNS_QUERY_STANDARD</b>
     */
    QueryOptions : Int64

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure.
     * 
     * If the query was completed asynchronously and this structure was returned directly from <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>, <b>pQueryRecords</b> is NULL.
     * 
     * If the query was completed synchronously or if this structure was returned by the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> DNS callback, <b>pQueryRecords</b> contains a list of Resource Records (RR) that comprise the response.
     * 
     * <div class="alert"><b>Note</b>  Applications must free returned RR sets with the <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsrecordlistfree">DnsRecordListFree</a> function.</div>
     * <div> </div>
     */
    pQueryRecords : DNS_RECORDA.Ptr

    Reserved : IntPtr

}
