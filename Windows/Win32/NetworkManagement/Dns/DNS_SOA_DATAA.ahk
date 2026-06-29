#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

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
 * @charset ANSI
 */
export default struct DNS_SOA_DATAA {
    #StructPack 8

    /**
     * A pointer to a string that represents the name of the authoritative DNS server for the zone to which the record belongs.
     */
    pNamePrimaryServer : PSTR

    /**
     * A pointer to a string that represents the name of the responsible party for the zone to which the record belongs.
     */
    pNameAdministrator : PSTR

    /**
     * The serial number of the SOA record.
     */
    dwSerialNo : UInt32

    /**
     * The time, in seconds, before the zone containing this record should be refreshed.
     */
    dwRefresh : UInt32

    /**
     * The time, in seconds, before retrying a failed refresh of the zone to which this record belongs.
     */
    dwRetry : UInt32

    /**
     * The time, in seconds, before an unresponsive zone is no longer authoritative.
     */
    dwExpire : UInt32

    /**
     * The lower limit on the time, in seconds, that a DNS server or caching resolver are allowed to cache any resource records (RR) from the zone to which this record belongs.
     */
    dwDefaultTtl : UInt32

}
