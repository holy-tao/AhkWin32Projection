#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_SOA_DATA structure represents a DNS start of authority (SOA) record as specified in section 3.3.13 of RFC 1035. (ANSI)
 * @remarks
 * The 
  * <b>DNS_SOA_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The windns.h header defines DNS_SOA_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_soa_dataa
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset ANSI
 */
class DNS_SOA_DATAA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A pointer to a string that represents the name of the authoritative DNS server for the zone to which the record belongs.
     * @type {Pointer<Ptr>}
     */
    pNamePrimaryServer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a string that represents the name of the responsible party for the zone to which the record belongs.
     * @type {Pointer<Ptr>}
     */
    pNameAdministrator {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The serial number of the SOA record.
     * @type {Integer}
     */
    dwSerialNo {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The time, in seconds, before the zone containing this record should be refreshed.
     * @type {Integer}
     */
    dwRefresh {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The time, in seconds, before retrying a failed refresh of the zone to which this record belongs.
     * @type {Integer}
     */
    dwRetry {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The time, in seconds, before an unresponsive zone is no longer authoritative.
     * @type {Integer}
     */
    dwExpire {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The lower limit on the time, in seconds, that a DNS server or caching resolver are allowed to cache any resource records (RR) from the zone to which this record belongs.
     * @type {Integer}
     */
    dwDefaultTtl {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
