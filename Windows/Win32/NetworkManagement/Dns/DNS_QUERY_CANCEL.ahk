#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * A DNS_QUERY_CANCEL structure can be used to cancel an asynchronous DNS query.
 * @remarks
 * This structure is returned in the <i>pCancelHandle</i> parameter from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/windns/nf-windns-dnsqueryex">DnsQueryEx</a>.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_query_cancel
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_QUERY_CANCEL {
    #StructPack 2

    /**
     * Contains a handle to the asynchronous query to cancel. Applications must not modify this value.
     */
    Reserved : CHAR[32]

}
