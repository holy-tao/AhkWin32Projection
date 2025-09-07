#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains the DNS query parameters used in a call to [DnsQueryEx](/windows/win32/api/windns/nf-windns-dnsqueryex).
 * @remarks
 * The custom servers specified in *pCustomServers* bypass the system-configured DNS servers.
  * 
  * If the query name matches a rule in the **Name Resolution Policy Table (NRPT)**, then the custom servers are ignored, and only the servers from the **NRPT** rule are used.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_query_request3
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_QUERY_REQUEST3 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The structure version must be the **DNS_QUERY_REQUEST_VERSION3**; which has a value of 3.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A pointer to a string that represents the DNS name to query.
     * 
     * > [!NOTE]
     * > If *QueryName* is **NULL**, then the query is for the local machine name.
     * @type {PWSTR}
     */
    QueryName{
        get {
            if(!this.HasProp("__QueryName"))
                this.__QueryName := PWSTR(this.ptr + 8)
            return this.__QueryName
        }
    }

    /**
     * Type: **[WORD](/windows/win32/winprog/windows-data-types)**
     * 
     * A value that represents the Resource Record (RR) [DNS Record Type](/windows/win32/dns/dns-constants#dns-record-types) that is queried. *QueryType* determines the format of data pointed to by *pQueryRecords* returned in the [DNS_QUERY_RESULT](/windows/win32/api/windns/ns-windns-dns_query_result) structure. For example, if the value of *wType* is [DNS_TYPE_A](/windows/win32/dns/dns-constants), then the format of data pointed to by *pQueryRecords* is [DNS_A_DATA](/windows/win32/api/windns/ns-windns-dns_a_data).
     * @type {Integer}
     */
    QueryType {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Type: **[ULONG64](/windows/win32/winprog/windows-data-types)**
     * 
     * A value that contains a bitmap of [DNS Query Options](/windows/win32/dns/dns-constants#dns-query-options) to use in the DNS query. Options can be combined, and all options override **DNS_QUERY_STANDARD**.
     * @type {Integer}
     */
    QueryOptions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: **[PDNS_ADDR_ARRAY](/windows/win32/api/windns/ns-windns-dns_addr_array)**
     * 
     * A pointer to a [DNS_ADDR_ARRAY](/windows/win32/api/windns/ns-windns-dns_addr_array) structure that contains a list of DNS servers to use in the query.
     * @type {Pointer<DNS_ADDR_ARRAY>}
     */
    pDnsServerList {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * A value that contains the interface index over which the query is sent. If *InterfaceIndex* is 0, then all interfaces will be considered.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: **[PDNS_QUERY_COMPLETION_ROUTINE](/windows/win32/api/windns/nc-windns-dns_query_completion_routine)**
     * 
     * A pointer to a [DNS_QUERY_COMPLETION_ROUTINE](/windows/win32/api/windns/nc-windns-dns_query_completion_routine) callback that is used to return the results of an asynchronous query from a call to [DnsQueryEx](/windows/win32/api/windns/nf-windns-dnsqueryex).
     * 
     * > [!NOTE]
     * > If **NULL**, then [DnsQueryEx](/windows/win32/api/windns/nf-windns-dnsqueryex) is called synchronously.
     * @type {Pointer<Ptr>}
     */
    pQueryCompletionCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: **[PVOID](/windows/win32/winprog/windows-data-types)**
     * 
     * A pointer to a user context.
     * @type {Pointer<Void>}
     */
    pQueryContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * Reserved.
     * @type {Integer}
     */
    IsNetworkQueryRequired {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * Reserved.
     * @type {Integer}
     */
    RequiredNetworkIndex {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of custom servers pointed to by the *pCustomServers* member.
     * @type {Integer}
     */
    cCustomServers {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: \_Field\_size\_(cCustomServers) **[DNS_CUSTOM_SERVER](/windows/win32/api/windns/ns-windns-dns_custom_server)\***
     * 
     * A pointer to an array of N (where N is given in the *cCustomServers* field) [DNS_CUSTOM_SERVER](/windows/win32/api/windns/ns-windns-dns_custom_server) objects.
     * 
     * If *cCustomServers* is 0, then *pCustomServers* must be **NULL**.
     * 
     * > [!NOTE]
     * > At least one of *pCustomServers* and *pDnsServerList* must be **NULL**. Both set to non-**NULL** values at the same time is not supported.
     * @type {Pointer<DNS_CUSTOM_SERVER>}
     */
    pCustomServers {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
