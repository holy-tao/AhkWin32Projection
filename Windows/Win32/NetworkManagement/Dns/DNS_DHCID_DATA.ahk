#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a DNS Dynamic Host Configuration Protocol Information (DHCID) resource record (RR) as specified in section 3 of RFC 4701.
 * @remarks
 * 
  * The 
  * <b>DNS_DHCID_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_dhcid_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_DHCID_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The length, in bytes, of <b>DHCID</b>.
     * @type {Integer}
     */
    dwByteCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <b>BYTE</b> array that contains the DHCID client, domain, and SHA-256 digest information as specified in section 4 of <a href="https://www.ietf.org/rfc/rfc2671.txt">RFC 2671</a>.
     * @type {Array<Byte>}
     */
    DHCID{
        get {
            if(!this.HasProp("__DHCIDProxyArray"))
                this.__DHCIDProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__DHCIDProxyArray
        }
    }
}
