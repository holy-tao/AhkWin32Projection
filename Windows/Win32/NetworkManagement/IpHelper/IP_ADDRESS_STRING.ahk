#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Stores an IPv4 address in dotted decimal notation.
 * @remarks
 * The <b>IP_ADDRESS_STRING</b> structure is used as  a parameter in  the  <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_addr_string">IP_ADDR_STRING</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_address_string
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IP_ADDRESS_STRING {
    #StructPack 2

    /**
     * A character string that represents an IPv4 address or an IPv4 subnet mask in dotted decimal notation.
     */
    String : CHAR[16]

}
