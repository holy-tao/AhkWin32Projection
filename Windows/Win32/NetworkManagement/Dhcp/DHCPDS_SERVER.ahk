#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCPDS_SERVER structure defines information on a DHCP server in the context of directory services.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcpds_server
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPDS_SERVER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Reserved. This value should be set to 0.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Unicode string that contains the unique name of the DHCP server.
     * @type {PWSTR}
     */
    ServerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the IP address of the DHCP server as an unsigned 32-bit integer.
     * @type {Integer}
     */
    ServerAddress {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies a set of bit flags that describe active directory settings for the DHCP server.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved. This value should be set to 0.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Unicode string that contains the active directory path to the DHCP server.
     * @type {PWSTR}
     */
    DsLocation {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved. This value should be set to 0.
     * @type {Integer}
     */
    DsLocType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
