#Requires AutoHotkey v2.0.0 64-bit

/**
 * The QOS_SET_FLOW enumeration indicates what is being changed about a flow.
 * @see https://docs.microsoft.com/windows/win32/api//qos2/ne-qos2-qos_set_flow
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_SET_FLOW{

    /**
     * Indicates that the traffic type of the flow will change.
     * @type {Integer (Int32)}
     */
    static QOSSetTrafficType => 0

    /**
     * Indicates that the flow rate will change.
     * @type {Integer (Int32)}
     */
    static QOSSetOutgoingRate => 1

    /**
     * Windows 7, Windows Server 2008 R2, and later: Indicates that the outgoing DSCP value will change.
 * 
 * <div class="alert"><b>Note</b>  This setting requires the calling application be a member of the Administrators or the  Network Configuration Operators group.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static QOSSetOutgoingDSCPValue => 2
}
