#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NLM_CONNECTION_COST enumeration specifies a set of cost levels and cost flags supported in Windows 8 Cost APIs.
 * @remarks
 * The value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nf-netlistmgr-inetworkconnectioncost-getcost">INetworkConnectionCost::GetCost</a> method can have multiple bits set with the values specified by this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_connection_cost
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_CONNECTION_COST extends Win32Enum{

    /**
     * The cost is unknown.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_COST_UNKNOWN => 0

    /**
     * The connection is unlimited and is considered to be unrestricted of usage charges and capacity constraints.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_COST_UNRESTRICTED => 1

    /**
     * The use of this connection is unrestricted up to a specific data transfer limit.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_COST_FIXED => 2

    /**
     * This connection is regulated on a per byte basis.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_COST_VARIABLE => 4

    /**
     * The connection is currently in an OverDataLimit state as it has exceeded the carrier specified data transfer limit.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_COST_OVERDATALIMIT => 65536

    /**
     * The network is experiencing high traffic load and is congested.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_COST_CONGESTED => 131072

    /**
     * The connection is roaming outside the network and  affiliates of the home provider.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_COST_ROAMING => 262144

    /**
     * The connection is approaching the data limit specified by the carrier.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_COST_APPROACHINGDATALIMIT => 524288
}
