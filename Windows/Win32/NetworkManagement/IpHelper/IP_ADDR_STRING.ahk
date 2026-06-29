#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IP_ADDRESS_STRING.ahk" { IP_ADDRESS_STRING }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Represents a node in a linked-list of IPv4 addresses.
 * @see https://learn.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_addr_string
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IP_ADDR_STRING {
    #StructPack 8

    /**
     * A pointer to the next 
     * <b>IP_ADDR_STRING</b> structure in the list.
     */
    Next : IP_ADDR_STRING.Ptr

    /**
     * A value that specifies a structure type with a single member, <b>String</b>. The <b>String</b> member is a <b>char</b> array of size 16. This array holds an IPv4 address in dotted decimal notation.
     */
    IpAddress : IP_ADDRESS_STRING

    /**
     * A value that specifies a structure type with a single member, <b>String</b>. The <b>String</b> member is a <b>char</b> array of size 16. This array holds the IPv4 subnet mask in dotted decimal notation.
     */
    IpMask : IP_ADDRESS_STRING

    /**
     * A network table entry (NTE). This value corresponds to the <i>NTEContext</i> parameters in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-addipaddress">AddIPAddress</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipaddress">DeleteIPAddress</a> functions.
     */
    Context : UInt32

}
