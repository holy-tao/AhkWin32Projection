#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_RRSET structure contains information about a DNS Resource Record (RR) set.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_rrset
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_RRSET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the first DNS RR in the set.
     * @type {Pointer<DNS_RECORDA>}
     */
    pFirstRR {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure that contains the last DNS RR in the set.
     * @type {Pointer<DNS_RECORDA>}
     */
    pLastRR {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
