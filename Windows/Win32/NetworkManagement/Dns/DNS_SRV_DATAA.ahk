#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 * @charset ANSI
 */
class DNS_SRV_DATAA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a string that represents the target host.
     * @type {Pointer<PSTR>}
     */
    pNameTarget {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The priority of the target host specified in <b>pNameTarget</b>. Lower numbers imply higher priority to clients attempting to use this service.
     * @type {Integer}
     */
    wPriority {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The relative weight of the target host in <b>pNameTarget</b> to other hosts with the same <b>wPriority</b>. The chances of using this host should be proportional to its weight.
     * @type {Integer}
     */
    wWeight {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The port used on the target host for this service.
     * @type {Integer}
     */
    wPort {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Reserved for padding. Do not use.
     * @type {Integer}
     */
    Pad {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
