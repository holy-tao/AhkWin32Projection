#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_LOC_DATA structure represents a DNS location (LOC) resource record (RR) as specified in RFC 1876.
 * @remarks
 * The 
 * <b>DNS_LOC_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_loc_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_LOC_DATA extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The version number of the representation. Must be zero.
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The diameter of a sphere enclosing the described entity, defined as "SIZE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     * @type {Integer}
     */
    wSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The horizontal data precision, defined as "HORIZ PRE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     * @type {Integer}
     */
    wHorPrec {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The vertical data precision, defined as "VERT PRE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     * @type {Integer}
     */
    wVerPrec {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The latitude of the center of the sphere, defined as "LATITUDE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     * @type {Integer}
     */
    dwLatitude {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The longitude of the center of the sphere, defined as "LONGITUDE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     * @type {Integer}
     */
    dwLongitude {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The altitude of the center of the sphere, defined as "ALTITUDE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     * @type {Integer}
     */
    dwAltitude {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
