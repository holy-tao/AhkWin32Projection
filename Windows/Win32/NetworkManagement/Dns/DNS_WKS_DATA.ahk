#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_WKS_DATA structure represents a DNS well-known services (WKS) record as specified in section 3.4.2 of RFC 1035.
 * @remarks
 * The 
 * <b>DNS_WKS_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_wks_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_WKS_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-data-types">IP4_ADDRESS</a> data type that contains the IPv4 address for this resource record (RR).
     * @type {Integer}
     */
    IpAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that represents the IP protocol for this RR as defined in <a href="https://www.ietf.org/rfc/rfc1010.txt">RFC 1010</a>.
     * @type {Integer}
     */
    chProtocol {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * A variable-length bitmask whose bits correspond to the port number of well known services offered by the protocol specified in <b>chProtocol</b>. The bitmask has one bit for every port of the supported protocol, but must be a multiple of a <b>BYTE</b>. Bit 0 corresponds to port 1, bit 1 corresponds to port 2, and so forth for a maximum of 1024 bits.
     * @type {Array<Byte>}
     */
    BitMask{
        get {
            if(!this.HasProp("__BitMaskProxyArray"))
                this.__BitMaskProxyArray := Win32FixedArray(this.ptr + 5, 1, Primitive, "char")
            return this.__BitMaskProxyArray
        }
    }
}
