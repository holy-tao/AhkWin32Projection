#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_FAILOVER_RELATIONSHIP structure defines information about a DHCPv4 server failover relationship.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FAILOVER_RELATIONSHIP extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the primary server IP address.
     * @type {Integer}
     */
    PrimaryServer {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the secondary server IP address.
     * @type {Integer}
     */
    SecondaryServer {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_failover_mode">DHCP_FAILOVER_MODE</a> enumeration that specifies the failover relationship mode.
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_failover_server">DHCP_FAILOVER_SERVER</a> enumeration that specifies if the server is the primary or secondary server in the failover relationship
     * @type {Integer}
     */
    ServerType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-fsm_state">FSM_STATE</a> enumeration that specifies the state of the failover relationship.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-fsm_state">FSM_STATE</a> enumeration that specifies the previous state of the failover relationship.
     * @type {Integer}
     */
    PrevState {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A value that specifies the Maximum Client Lead Time (MCLT) in seconds. The MCLT is the maximum time that one server can extend a lease for a client beyond the lease time known by the partner server.
     * @type {Integer}
     */
    Mclt {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The time, in seconds, a server will wait before transitioning from the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-fsm_state">COMMUNICATION-INT</a> state to a <b>PARTNER-DOWN</b> state. The timer begins when the server enters the <b>COMMUNICATION-INT</b> state.
     * @type {Integer}
     */
    SafePeriod {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the unique failover relationship name.
     * @type {PWSTR}
     */
    RelationshipName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the primary server hostname.
     * @type {PWSTR}
     */
    PrimaryServerName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the secondary server hostname.
     * @type {PWSTR}
     */
    SecondaryServerName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_array">LPDHCP_IP_ARRAY</a> structure that contains the list of IPv4 subnet addresses that are part of the failover relationship and define its scope.
     * @type {Pointer<DHCP_IP_ARRAY>}
     */
    pScopes {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Value that specifies the ratio of the client load shared by the primary server in the failover relationship.
     * @type {Integer}
     */
    Percentage {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }

    /**
     * A pointer to a null-terminated Unicode string that represents the shared secret key associated with the failover relationship.
     * @type {PWSTR}
     */
    SharedSecret {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
