#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The DNS_QUERY_REQUEST structure contains the DNS query parameters used in a call to DnsQueryEx.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_query_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_QUERY_REQUEST extends Win32Struct
{
    static sizeof => 64

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
     * A pointer to a string that represents the DNS name to query.
     * 
     * <div class="alert"><b>Note</b>  If <b>QueryName</b> is NULL, the query is for the local machine name.</div>
     * <div> </div>
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
     * A value that represents the Resource Record (RR) <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a> that is queried. <b>QueryType</b> determines the format of data pointed to by <b>pQueryRecords</b> returned in the <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-dns_query_result">DNS_QUERY_RESULT</a> structure. For example, if the value of <b>wType</b> is <b>DNS_TYPE_A</b>, the format of data pointed to by <b>pQueryRecords</b> is <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a>.
     * @type {Integer}
     */
    QueryType {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * A value that contains a bitmap of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Query  Options</a> to use in the DNS query. Options can be combined and all options override <b>DNS_QUERY_STANDARD</b>
     * @type {Integer}
     */
    QueryOptions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr_array">DNS_ADDR_ARRAY</a> structure that contains a list of DNS servers to use in the query.
     * @type {Pointer<DNS_ADDR_ARRAY>}
     */
    pDnsServerList {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A value that contains the interface index over which the query is sent. If <b>InterfaceIndex</b> is 0, all interfaces will be considered.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windns/nc-windns-dns_query_completion_routine">DNS_QUERY_COMPLETION_ROUTINE</a> callback that is used to return the results of an asynchronous query from a  call to <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>.
     * 
     * <div class="alert"><b>Note</b>  If NULL, <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a> is called synchronously.</div>
     * <div> </div>
     * @type {Pointer<PDNS_QUERY_COMPLETION_ROUTINE>}
     */
    pQueryCompletionCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to a user context.
     * @type {Pointer<Void>}
     */
    pQueryContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
