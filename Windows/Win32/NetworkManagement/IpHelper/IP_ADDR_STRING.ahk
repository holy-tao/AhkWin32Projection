#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IP_ADDRESS_STRING.ahk

/**
 * Represents a node in a linked-list of IPv4 addresses.
 * @see https://docs.microsoft.com/windows/win32/api//iptypes/ns-iptypes-ip_addr_string
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADDR_STRING extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A pointer to the next 
     * <b>IP_ADDR_STRING</b> structure in the list.
     * @type {Pointer<IP_ADDR_STRING>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A value that specifies a structure type with a single member, <b>String</b>. The <b>String</b> member is a <b>char</b> array of size 16. This array holds an IPv4 address in dotted decimal notation.
     * @type {IP_ADDRESS_STRING}
     */
    IpAddress{
        get {
            if(!this.HasProp("__IpAddress"))
                this.__IpAddress := IP_ADDRESS_STRING(8, this)
            return this.__IpAddress
        }
    }

    /**
     * A value that specifies a structure type with a single member, <b>String</b>. The <b>String</b> member is a <b>char</b> array of size 16. This array holds the IPv4 subnet mask in dotted decimal notation.
     * @type {IP_ADDRESS_STRING}
     */
    IpMask{
        get {
            if(!this.HasProp("__IpMask"))
                this.__IpMask := IP_ADDRESS_STRING(40, this)
            return this.__IpMask
        }
    }

    /**
     * A network table entry (NTE). This value corresponds to the <i>NTEContext</i> parameters in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-addipaddress">AddIPAddress</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-deleteipaddress">DeleteIPAddress</a> functions.
     * @type {Integer}
     */
    Context {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
