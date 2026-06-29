#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_LOC_DATA structure represents a DNS location (LOC) resource record (RR) as specified in RFC 1876.
 * @remarks
 * The 
 * <b>DNS_LOC_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_loc_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_LOC_DATA {
    #StructPack 4

    /**
     * The version number of the representation. Must be zero.
     */
    wVersion : UInt16

    /**
     * The diameter of a sphere enclosing the described entity, defined as "SIZE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     */
    wSize : UInt16

    /**
     * The horizontal data precision, defined as "HORIZ PRE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     */
    wHorPrec : UInt16

    /**
     * The vertical data precision, defined as "VERT PRE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     */
    wVerPrec : UInt16

    /**
     * The latitude of the center of the sphere, defined as "LATITUDE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     */
    dwLatitude : UInt32

    /**
     * The longitude of the center of the sphere, defined as "LONGITUDE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     */
    dwLongitude : UInt32

    /**
     * The altitude of the center of the sphere, defined as "ALTITUDE"         in section 2 of <a href="https://www.ietf.org/rfc/rfc1876.txt">RFC 1876</a>.
     */
    dwAltitude : UInt32

}
