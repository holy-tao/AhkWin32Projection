#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DATE_TIME.ahk

/**
 * Defines information returned from the DHCP-specific SNMP Management Information Block (MIB) about the current DHCP service.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_mib_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_MIB_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Contains the number of DHCP discovery messages received.
     * @type {Integer}
     */
    Discovers {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the number of DHCP service offer messages transmitted.
     * @type {Integer}
     */
    Offers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the number of dynamic address request messages received.
     * @type {Integer}
     */
    Requests {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the number of DHCP ACK messages received.
     * @type {Integer}
     */
    Acks {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Contains the number of DHCP NACK messages received.
     * @type {Integer}
     */
    Naks {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Contains the number of dynamic address service decline messages received.
     * @type {Integer}
     */
    Declines {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Contains the number of dynamic address release messages received.
     * @type {Integer}
     */
    Releases {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> structure that contains the date and time the DHCP service started.
     * @type {DATE_TIME}
     */
    ServerStartTime{
        get {
            if(!this.HasProp("__ServerStartTime"))
                this.__ServerStartTime := DATE_TIME(32, this)
            return this.__ServerStartTime
        }
    }

    /**
     * Contains the number of scopes defined on the DHCP server.
     * @type {Integer}
     */
    Scopes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-scope_mib_info">SCOPE_MIB_INFO</a> structures that contain information on each subnet defined on the server. There are exactly <b>Scopes</b> elements in this array. If no subnets are defined (<b>Scopes</b> is 0), this field will be <b>NULL</b>.
     * @type {Pointer<SCOPE_MIB_INFO>}
     */
    ScopeInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
