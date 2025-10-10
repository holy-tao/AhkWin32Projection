#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCPDS_SERVERS structure defines a list of DHCP servers in the context of directory services.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcpds_servers
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPDS_SERVERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved. This value should be 0.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number of elements in <b>Servers</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpds_server">DHCPDS_SERVER</a> structures that contain information on individual DHCP servers.
     * @type {Pointer<DHCPDS_SERVER>}
     */
    Servers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
