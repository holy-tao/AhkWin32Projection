#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCOPE_MIB_INFO_V5.ahk" { SCOPE_MIB_INFO_V5 }
#Import ".\DATE_TIME.ahk" { DATE_TIME }

/**
 * Contains statistical information about a DHCP server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_mib_info_v5
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_MIB_INFO_V5 {
    #StructPack 8

    /**
     * The number of DISCOVER messages received by the DHCP server.
     */
    Discovers : UInt32

    /**
     * The number of OFFER messages sent to DHCP clients.
     */
    Offers : UInt32

    /**
     * The number of REQUEST messages received by  DHCP clients.
     */
    Requests : UInt32

    /**
     * The number of ACK messages sent by the DHCP server.
     */
    Acks : UInt32

    /**
     * The number of NACK messages sent by the DHCP server.
     */
    Naks : UInt32

    /**
     * The number of DECLINE messages sent by DHCP clients.
     */
    Declines : UInt32

    /**
     * The number of RELEASE messages  received by the DHCP server.
     */
    Releases : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> structure that contains the most recent time the DHCP server was started.
     */
    ServerStartTime : DATE_TIME

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     */
    QtnNumLeases : UInt32

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     */
    QtnPctQtnLeases : UInt32

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     */
    QtnProbationLeases : UInt32

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     */
    QtnNonQtnLeases : UInt32

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     */
    QtnExemptLeases : UInt32

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     */
    QtnCapableClients : UInt32

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     */
    QtnIASErrors : UInt32

    /**
     * The number of OFFER messages sent with a specific delay by the DHCP server.
     */
    DelayedOffers : UInt32

    /**
     * The number of scopes with a delay value greater than 0.
     */
    ScopesWithDelayedOffers : UInt32

    /**
     * The total number of scopes configured on the DHCP server
     */
    Scopes : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-scope_mib_info_v5">SCOPE_MIB_INFO_V5</a> structure that contains specific information about the scopes configured on the DHCP server.
     */
    ScopeInfo : SCOPE_MIB_INFO_V5.Ptr

}
