#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NL_NEIGHBOR_STATE enumeration type defines the state of a network layer neighbor IP address, as described in RFC 2461, section 7.3.2.
 * @remarks
 * 
 * For more information about RFC 2461, section 7.3.2, see the 
 *     <a href="https://www.ietf.org/rfc/rfc2461.txt">Neighbor Discovery for IP Version 6
 *     (IPv6)</a> memo from Network Working Group.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//nldef/ne-nldef-nl_neighbor_state
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_NEIGHBOR_STATE{

    /**
     * The IP address is unreachable.
     * @type {Integer (Int32)}
     */
    static NlnsUnreachable => 0

    /**
     * Address resolution is in progress and the link-layer address of the neighbor has not yet been
 *      determined. Specifically for IPv6, a Neighbor Solicitation message has been sent to the solicited-node multicast
 *      IP address of the target, but the corresponding neighbor advertisement has not yet been received.
     * @type {Integer (Int32)}
     */
    static NlnsIncomplete => 1

    /**
     * The neighbor is no longer known to be reachable, and probes are being sent to verify reachability.
 *      For IPv6, a reachability confirmation is actively being sought by regularly retransmitting unicast
 *      Neighbor Solicitation probes until a reachability confirmation is received.
     * @type {Integer (Int32)}
     */
    static NlnsProbe => 2

    /**
     * The neighbor is no longer known to be reachable, and traffic has recently been sent to the
 *      neighbor. However, instead of probing the neighbor immediately, sending probes is delayed for a short
 *      time to give upper layer protocols an opportunity to provide reachability confirmation. For IPv6, more
 *      time has elapsed than is specified in the 
 *      <b>ReachabilityTime.ReachableTime</b> member of the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff559263(v=vs.85)">MIB_IPNET_ROW2</a> structure since the last
 *      positive confirmation was received that the forward path was functioning properly and a packet was sent.
 *      If no reachability confirmation is received within a period of time (used to delay the first probe) of
 *      entering the <b>NlnsDelay</b> state, a IPv6 Neighbor Solicitation (NS) message is sent, and the 
 *      <b>State</b> member of MIB_IPNET_ROW2 is changed to NlnsProbe.
     * @type {Integer (Int32)}
     */
    static NlnsDelay => 3

    /**
     * The neighbor is no longer known to be reachable, but until traffic is sent to the neighbor, no
 *      attempt should be made to verify its reachability. For IPv6, more time has elapsed than is specified in
 *      the 
 *      <b>ReachabilityTime.ReachableTime</b> member of the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff559263(v=vs.85)">MIB_IPNET_ROW2</a> structure since the last
 *      positive confirmation was received that the forward path was functioning properly. While the 
 *      <b>State</b> member of MIB_IPNET_ROW2 is NlnsStale, no action occurs until a packet is sent. The
 *      <b>NlnsStale</b> state is entered upon receiving an unsolicited neighbor discovery message that updates the
 *      cached IP address. Receipt of such a message does not confirm reachability, and entering the NlnsStale
 *      state insures reachability is verified quickly if the entry is actually being used. However,
 *      reachability is not actually verified until the entry is actually used.
     * @type {Integer (Int32)}
     */
    static NlnsStale => 4

    /**
     * The neighbor is known to have been reachable recently (within tens of seconds ago). For IPv6, a
 *      positive confirmation was received within the time that is specified in the 
 *      <b>ReachabilityTime.ReachableTime</b> member of the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff559263(v=vs.85)">MIB_IPNET_ROW2</a> structure that the forward
 *      path to the neighbor was functioning properly. While the 
 *      <b>State</b> member of MIB_IPNET_ROW2 is NlnsReachable, no special action occurs as packets are
 *      sent.
     * @type {Integer (Int32)}
     */
    static NlnsReachable => 5

    /**
     * The IP address is a permanent address.
     * @type {Integer (Int32)}
     */
    static NlnsPermanent => 6

    /**
     * A maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static NlnsMaximum => 7
}
