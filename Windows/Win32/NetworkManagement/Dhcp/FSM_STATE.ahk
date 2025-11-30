#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FSM_STATE enumeration defines the set of possible failover relationship states on a DHCPv4 server.
 * @remarks
 * 
 * These states are in conformance with the states described in the IETF Failover Protocol draft: <a href="https://tools.ietf.org/html/draft-ietf-dhc-failover-12">http://tools.ietf.org/html/draft-ietf-dhc-failover-12</a>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ne-dhcpsapi-fsm_state
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class FSM_STATE extends Win32Enum{

    /**
     * Indicates that no state is configured for the DHCPv4 failover relationship.
     * @type {Integer (Int32)}
     */
    static NO_STATE => 0

    /**
     * Indicates that the failover relationship on the DHCPv4 server is in the initialization state.
     * @type {Integer (Int32)}
     */
    static INIT => 1

    /**
     * Indicates that each server participating in the failover relationship can probe its partner server before starting the DHCP client service. A DHCPv4 server moves into the <b>STARTUP</b> state after <b>INIT</b>.
     * @type {Integer (Int32)}
     */
    static STARTUP => 2

    /**
     * Indicates that each server in the failover relationship can service <i>DHCPDISCOVER</i> messages and all other DHCP requests as defined in <a href="http://www.ietf.org/rfc/rfc2131.txt">RFC2131</a>. DHCPv4 servers in the <b>NORMAL</b> state can not service <i>DHCPREQUEST/RENEWAL</i> or <i>DHCPREQUEST/REBINDING</i> requests from the client set defined according to  the load balancing algorithm in <a href="https://tools.ietf.org/html/rfc3074">RFC3074</a>. However, each server can service <i>DHCPREQUEST/RENEWAL</i> or <i>DHCPDISCOVER/REBINDING</i> requests from any client.
     * @type {Integer (Int32)}
     */
    static NORMAL => 3

    /**
     * Indicates that each server in a failover relationship is operating independently, but neither assumes that their partner is not operating. The partner server might be operating and simply unable to communicate with this server, or it might not be operating at all.
     * @type {Integer (Int32)}
     */
    static COMMUNICATION_INT => 4

    /**
     * Indicates that a server assumes its partner is not currently operating.
     * @type {Integer (Int32)}
     */
    static PARTNER_DOWN => 5

    /**
     * Indicates that a failover relationship between two DHCPv4 servers is attempting to reestablish itself.
     * @type {Integer (Int32)}
     */
    static POTENTIAL_CONFLICT => 6

    /**
     * Indicates that  the primary server has received all updates from the secondary server during the failover relationship reintegration process.
     * @type {Integer (Int32)}
     */
    static CONFLICT_DONE => 7

    /**
     * Indicates that two servers in the <b>POTENTIAL_CONFLICT</b> state were attempting to reintegrate their failover relationship with each other, but communications between them failed prior to completion of the reintegration.
     * @type {Integer (Int32)}
     */
    static RESOLUTION_INT => 8

    /**
     * Indicates that a server in a failover relationship has no information in its stable storage facility or that it is reintegrating with a server in the <b>PARTNER_DOWN</b> state.
     * @type {Integer (Int32)}
     */
    static RECOVER => 9

    /**
     * Indicates that the DHCPv4 server should wait for a time period equal to Maximum Client Lead Time (MCLT) before moving to the <b>RECOVER_DONE</b> state. The MCLT is the maximum time, in seconds, that one server can extend a lease for a client beyond the lease time known by the partner server.
     * @type {Integer (Int32)}
     */
    static RECOVER_WAIT => 10

    /**
     * This value enables an interlocked transition of one server from the <b>RECOVER</b> state and another server from the <b>PARTNER_DOWN</b> or <b>COMMUNICATION-INT</b> state to the <b>NORMAL</b> state.
     * @type {Integer (Int32)}
     */
    static RECOVER_DONE => 11

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static PAUSED => 12

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static SHUTDOWN => 13
}
