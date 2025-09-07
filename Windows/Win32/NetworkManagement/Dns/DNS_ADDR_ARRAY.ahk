#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_ADDR.ahk

/**
 * Stores an array of IPv4 or IPv6 addresses.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr_array
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_ADDR_ARRAY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 1

    /**
     * Indicates, the size, in bytes,  of this structure.
     * @type {Integer}
     */
    MaxCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the number of <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr">DNS_ADDR</a> structures contained in the <b>AddrArray</b> member.
     * @type {Integer}
     */
    AddrCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    Tag {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

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
     * @type {Integer}
     */
    Family {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    WordReserved {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    MatchFlag {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr">DNS_ADDR</a> structures that each contain an IP address.
     * @type {Array<DNS_ADDR>}
     */
    AddrArray{
        get {
            if(!this.HasProp("__AddrArrayProxyArray"))
                this.__AddrArrayProxyArray := Win32FixedArray(this.ptr + 32, 8, DNS_ADDR, "")
            return this.__AddrArrayProxyArray
        }
    }
}
