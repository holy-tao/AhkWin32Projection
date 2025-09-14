#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores an IPv4 address in dotted decimal notation.
 * @remarks
 * The <b>IP_ADDRESS_STRING</b> structure is used as  a parameter in  the  <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_addr_string">IP_ADDR_STRING</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_address_string
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADDRESS_STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * A character string that represents an IPv4 address or an IPv4 subnet mask in dotted decimal notation.
     * @type {Array<SByte>}
     */
    String{
        get {
            if(!this.HasProp("__StringProxyArray"))
                this.__StringProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__StringProxyArray
        }
    }
}
