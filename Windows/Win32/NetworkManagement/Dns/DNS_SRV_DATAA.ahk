#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The DNS_SRV_DATA structure represents a DNS service (SRV) record as specified in RFC 2782. (ANSI)
 * @remarks
 * The 
 * <b>DNS_SRV_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The windns.h header defines DNS_SRV_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_srv_dataa
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @charset ANSI
 */
export default struct DNS_SRV_DATAA {
    #StructPack 8

    /**
     * A pointer to a string that represents the target host.
     */
    pNameTarget : PSTR

    /**
     * The priority of the target host specified in <b>pNameTarget</b>. Lower numbers imply higher priority to clients attempting to use this service.
     */
    wPriority : UInt16

    /**
     * The relative weight of the target host in <b>pNameTarget</b> to other hosts with the same <b>wPriority</b>. The chances of using this host should be proportional to its weight.
     */
    wWeight : UInt16

    /**
     * The port used on the target host for this service.
     */
    wPort : UInt16

    /**
     * Reserved for padding. Do not use.
     */
    Pad : UInt16

}
