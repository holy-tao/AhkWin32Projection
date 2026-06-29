#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCOPE_MIB_INFO.ahk" { SCOPE_MIB_INFO }
#Import ".\DATE_TIME.ahk" { DATE_TIME }

/**
 * Defines information returned from the DHCP-specific SNMP Management Information Block (MIB) about the current DHCP service.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_mib_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_MIB_INFO {
    #StructPack 8

    /**
     * Contains the number of DHCP discovery messages received.
     */
    Discovers : UInt32

    /**
     * Contains the number of DHCP service offer messages transmitted.
     */
    Offers : UInt32

    /**
     * Contains the number of dynamic address request messages received.
     */
    Requests : UInt32

    /**
     * Contains the number of DHCP ACK messages received.
     */
    Acks : UInt32

    /**
     * Contains the number of DHCP NACK messages received.
     */
    Naks : UInt32

    /**
     * Contains the number of dynamic address service decline messages received.
     */
    Declines : UInt32

    /**
     * Contains the number of dynamic address release messages received.
     */
    Releases : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> structure that contains the date and time the DHCP service started.
     */
    ServerStartTime : DATE_TIME

    /**
     * Contains the number of scopes defined on the DHCP server.
     */
    Scopes : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-scope_mib_info">SCOPE_MIB_INFO</a> structures that contain information on each subnet defined on the server. There are exactly <b>Scopes</b> elements in this array. If no subnets are defined (<b>Scopes</b> is 0), this field will be <b>NULL</b>.
     */
    ScopeInfo : SCOPE_MIB_INFO.Ptr

}
