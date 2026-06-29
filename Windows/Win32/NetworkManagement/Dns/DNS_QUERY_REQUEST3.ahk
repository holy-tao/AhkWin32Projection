#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DNS_ADDR_ARRAY.ahk" { DNS_ADDR_ARRAY }
#Import ".\DNS_CUSTOM_SERVER.ahk" { DNS_CUSTOM_SERVER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the DNS query parameters used in a call to [DnsQueryEx](/windows/win32/api/windns/nf-windns-dnsqueryex).
 * @remarks
 * The custom servers specified in *pCustomServers* bypass the system-configured DNS servers.
 * 
 * If the query name matches a rule in the **Name Resolution Policy Table (NRPT)**, then the custom servers are ignored, and only the servers from the **NRPT** rule are used.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_query_request3
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_QUERY_REQUEST3 {
    #StructPack 8

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The structure version must be the **DNS_QUERY_REQUEST_VERSION3**; which has a value of 3.
     */
    Version : UInt32

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A pointer to a string that represents the DNS name to query.
     * 
     * > [!NOTE]
     * > If *QueryName* is **NULL**, then the query is for the local machine name.
     */
    QueryName : PWSTR

    /**
     * Type: **[WORD](/windows/win32/winprog/windows-data-types)**
     * 
     * A value that represents the Resource Record (RR) [DNS Record Type](/windows/win32/dns/dns-constants#dns-record-types) that is queried. *QueryType* determines the format of data pointed to by *pQueryRecords* returned in the [DNS_QUERY_RESULT](/windows/win32/api/windns/ns-windns-dns_query_result) structure. For example, if the value of *wType* is [DNS_TYPE_A](/windows/win32/dns/dns-constants), then the format of data pointed to by *pQueryRecords* is [DNS_A_DATA](/windows/win32/api/windns/ns-windns-dns_a_data).
     */
    QueryType : UInt16

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * A value that contains a bitmap of [DNS Query Options](/windows/win32/dns/dns-constants#dns-query-options) to use in the DNS query. Options can be combined, and all options override **DNS_QUERY_STANDARD**.
     */
    QueryOptions : Int64

    /**
     * Type: **[PDNS_ADDR_ARRAY](/windows/win32/api/windns/ns-windns-dns_addr_array)**
     * 
     * A pointer to a [DNS_ADDR_ARRAY](/windows/win32/api/windns/ns-windns-dns_addr_array) structure that contains a list of DNS servers to use in the query.
     */
    pDnsServerList : DNS_ADDR_ARRAY.Ptr

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * A value that contains the interface index over which the query is sent. If *InterfaceIndex* is 0, then all interfaces will be considered.
     */
    InterfaceIndex : UInt32

    /**
     * Type: **[PDNS_QUERY_COMPLETION_ROUTINE](/windows/win32/api/windns/nc-windns-dns_query_completion_routine)**
     * 
     * A pointer to a [DNS_QUERY_COMPLETION_ROUTINE](/windows/win32/api/windns/nc-windns-dns_query_completion_routine) callback that is used to return the results of an asynchronous query from a call to [DnsQueryEx](/windows/win32/api/windns/nf-windns-dnsqueryex).
     * 
     * > [!NOTE]
     * > If **NULL**, then [DnsQueryEx](/windows/win32/api/windns/nf-windns-dnsqueryex) is called synchronously.
     */
    pQueryCompletionCallback : IntPtr

    /**
     * Type: **[PVOID](/windows/win32/winprog/windows-data-types)**
     * 
     * A pointer to a user context.
     */
    pQueryContext : IntPtr

    /**
     * Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * Reserved.
     */
    IsNetworkQueryRequired : BOOL

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * Reserved.
     */
    RequiredNetworkIndex : UInt32

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of custom servers pointed to by the *pCustomServers* member.
     */
    cCustomServers : UInt32

    /**
     * Type: \_Field\_size\_(cCustomServers) **[DNS_CUSTOM_SERVER](/windows/win32/api/windns/ns-windns-dns_custom_server)\***
     * 
     * A pointer to an array of N (where N is given in the *cCustomServers* field) [DNS_CUSTOM_SERVER](/windows/win32/api/windns/ns-windns-dns_custom_server) objects.
     * 
     * If *cCustomServers* is 0, then *pCustomServers* must be **NULL**.
     * 
     * > [!NOTE]
     * > At least one of *pCustomServers* and *pDnsServerList* must be **NULL**. Both set to non-**NULL** values at the same time is not supported.
     */
    pCustomServers : DNS_CUSTOM_SERVER.Ptr

}
