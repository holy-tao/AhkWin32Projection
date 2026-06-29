#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FSM_STATE.ahk" { FSM_STATE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_FAILOVER_MODE.ahk" { DHCP_FAILOVER_MODE }
#Import ".\DHCP_IP_ARRAY.ahk" { DHCP_IP_ARRAY }
#Import ".\DHCP_FAILOVER_SERVER.ahk" { DHCP_FAILOVER_SERVER }

/**
 * The DHCP_FAILOVER_RELATIONSHIP structure defines information about a DHCPv4 server failover relationship.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FAILOVER_RELATIONSHIP {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the primary server IP address.
     */
    PrimaryServer : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the secondary server IP address.
     */
    SecondaryServer : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_failover_mode">DHCP_FAILOVER_MODE</a> enumeration that specifies the failover relationship mode.
     */
    Mode : DHCP_FAILOVER_MODE

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_failover_server">DHCP_FAILOVER_SERVER</a> enumeration that specifies if the server is the primary or secondary server in the failover relationship
     */
    ServerType : DHCP_FAILOVER_SERVER

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-fsm_state">FSM_STATE</a> enumeration that specifies the state of the failover relationship.
     */
    State : FSM_STATE

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-fsm_state">FSM_STATE</a> enumeration that specifies the previous state of the failover relationship.
     */
    PrevState : FSM_STATE

    /**
     * A value that specifies the Maximum Client Lead Time (MCLT) in seconds. The MCLT is the maximum time that one server can extend a lease for a client beyond the lease time known by the partner server.
     */
    Mclt : UInt32

    /**
     * The time, in seconds, a server will wait before transitioning from the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-fsm_state">COMMUNICATION-INT</a> state to a <b>PARTNER-DOWN</b> state. The timer begins when the server enters the <b>COMMUNICATION-INT</b> state.
     */
    SafePeriod : UInt32

    /**
     * Pointer to a null-terminated Unicode string that represents the unique failover relationship name.
     */
    RelationshipName : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that represents the primary server hostname.
     */
    PrimaryServerName : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that represents the secondary server hostname.
     */
    SecondaryServerName : PWSTR

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_array">LPDHCP_IP_ARRAY</a> structure that contains the list of IPv4 subnet addresses that are part of the failover relationship and define its scope.
     */
    pScopes : DHCP_IP_ARRAY.Ptr

    /**
     * Value that specifies the ratio of the client load shared by the primary server in the failover relationship.
     */
    Percentage : Int8

    /**
     * A pointer to a null-terminated Unicode string that represents the shared secret key associated with the failover relationship.
     */
    SharedSecret : PWSTR

}
