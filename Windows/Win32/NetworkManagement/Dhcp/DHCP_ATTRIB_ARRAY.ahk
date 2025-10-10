#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a set of DHCP server attributes.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_attrib_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_ATTRIB_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of attributes listed in <b>DhcpAttribs</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_attrib">DHCP_ATTRIB</a> structures that contain the DHCP server attributes.
     * @type {Pointer<DHCP_ATTRIB>}
     */
    DhcpAttribs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
