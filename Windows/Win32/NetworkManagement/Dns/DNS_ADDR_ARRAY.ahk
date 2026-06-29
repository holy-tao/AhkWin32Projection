#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_ADDR.ahk" { DNS_ADDR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Stores an array of IPv4 or IPv6 addresses.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr_array
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_ADDR_ARRAY {
    #StructPack 4

    /**
     * Indicates, the size, in bytes,  of this structure.
     */
    MaxCount : UInt32

    /**
     * Indicates the number of <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr">DNS_ADDR</a> structures contained in the <b>AddrArray</b> member.
     */
    AddrCount : UInt32

    /**
     * Reserved. Do not use.
     */
    Tag : UInt32

    /**
     * A value that specifies the IP family. Possible values are:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv6
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4
     * 
     * </td>
     * </tr>
     * </table>
     */
    Family : UInt16

    /**
     * Reserved. Do not use.
     */
    WordReserved : UInt16

    /**
     * Reserved. Do not use.
     */
    Flags : UInt32

    /**
     * Reserved. Do not use.
     */
    MatchFlag : UInt32

    /**
     * Reserved. Do not use.
     */
    Reserved1 : UInt32

    /**
     * Reserved. Do not use.
     */
    Reserved2 : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr">DNS_ADDR</a> structures that each contain an IP address.
     */
    AddrArray : DNS_ADDR[1]

}
