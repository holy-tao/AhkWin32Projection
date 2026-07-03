#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DNS_ADDR_ARRAY.ahk" { DNS_ADDR_ARRAY }

/**
 * The DNS_QUERY_REQUEST structure contains the DNS query parameters used in a call to DnsQueryEx.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_query_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_QUERY_REQUEST {
    #StructPack 8

    /**
     * The structure version must be one of the following:
     */
    Version : UInt32

    /**
     * A pointer to a string that represents the DNS name to query.
     * 
     * <div class="alert"><b>Note</b>  If <b>QueryName</b> is NULL, the query is for the local machine name.</div>
     * <div> </div>
     */
    QueryName : PWSTR

    /**
     * A value that represents the Resource Record (RR) <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a> that is queried. <b>QueryType</b> determines the format of data pointed to by <b>pQueryRecords</b> returned in the <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_query_result">DNS_QUERY_RESULT</a> structure. For example, if the value of <b>wType</b> is <b>DNS_TYPE_A</b>, the format of data pointed to by <b>pQueryRecords</b> is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
     */
    QueryType : UInt16

    /**
     * A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Query  Options</a> to use in the DNS query. Options can be combined and all options override <b>DNS_QUERY_STANDARD</b>
     */
    QueryOptions : Int64

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr_array">DNS_ADDR_ARRAY</a> structure that contains a list of DNS servers to use in the query.
     */
    pDnsServerList : DNS_ADDR_ARRAY.Ptr

    /**
     * A value that contains the interface index over which the query is sent. If <b>InterfaceIndex</b> is 0, all interfaces will be considered.
     */
    InterfaceIndex : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> callback that is used to return the results of an asynchronous query from a  call to <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>.
     * 
     * <div class="alert"><b>Note</b>  If NULL, <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a> is called synchronously.</div>
     * <div> </div>
     */
    pQueryCompletionCallback : IntPtr

    /**
     * A pointer to a user context.
     */
    pQueryContext : IntPtr

}
