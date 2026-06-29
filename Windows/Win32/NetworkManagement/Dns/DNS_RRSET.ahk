#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_RECORDA.ahk" { DNS_RECORDA }

/**
 * The DNS_RRSET structure contains information about a DNS Resource Record (RR) set.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_rrset
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_RRSET {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the first DNS RR in the set.
     */
    pFirstRR : DNS_RECORDA.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the last DNS RR in the set.
     */
    pLastRR : DNS_RECORDA.Ptr

}
