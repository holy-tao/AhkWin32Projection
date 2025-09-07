#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an NSEC resource record (RR) as specified in section 4 of RFC 4034. (Unicode)
 * @remarks
 * The 
  * <b>DNS_NSEC_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The windns.h header defines DNS_NSEC_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_nsec_dataw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset Unicode
 */
class DNS_NSEC_DATAW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a string that represents the authoritative owner name of the next domain in the canonical ordering of the zone as specified in section 4.1.1 of <a href="https://www.ietf.org/rfc/rfc4034.txt">RFC 4034</a>.
     * @type {Pointer<Ptr>}
     */
    pNextDomainName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The length, in bytes, of <b>TypeBitMaps</b>.
     * @type {Integer}
     */
    wTypeBitMapsLength {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    wPad {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * A <b>BYTE</b> array that contains a bitmap that specifies which RR types are supported by the NSEC RR owner. Each bit in the array corresponds to a <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a> as defined in section in section 4.1.2 of <a href="https://www.ietf.org/rfc/rfc4034.txt">RFC 4034</a>.
     * @type {Array<Byte>}
     */
    TypeBitMaps{
        get {
            if(!this.HasProp("__TypeBitMapsProxyArray"))
                this.__TypeBitMapsProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__TypeBitMapsProxyArray
        }
    }
}
