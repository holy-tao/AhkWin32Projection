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
    static sizeof => 32

    static packingSize => 2

    /**
     * A character string that represents an IPv4 address or an IPv4 subnet mask in dotted decimal notation.
     * @type {String}
     */
    String {
        get => StrGet(this.ptr + 0, 15, "UTF-16")
        set => StrPut(value, this.ptr + 0, 15, "UTF-16")
    }
}
