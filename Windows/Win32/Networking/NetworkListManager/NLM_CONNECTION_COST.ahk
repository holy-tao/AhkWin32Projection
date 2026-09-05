#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NLM_CONNECTION_COST enumeration specifies a set of cost levels and cost flags supported in Windows 8 Cost APIs.
 * @remarks
 * The value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nf-netlistmgr-inetworkconnectioncost-getcost">INetworkConnectionCost::GetCost</a> method can have multiple bits set with the values specified by this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_connection_cost
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
class NLM_CONNECTION_COST extends Win32Enum {

    /**
     * The cost is unknown.
     * Native name: NLM_CONNECTION_COST_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The connection is unlimited and is considered to be unrestricted of usage charges and capacity constraints.
     * Native name: NLM_CONNECTION_COST_UNRESTRICTED
     * @type {Integer (Int32)}
     */
    static UNRESTRICTED => 1

    /**
     * The use of this connection is unrestricted up to a specific data transfer limit.
     * Native name: NLM_CONNECTION_COST_FIXED
     * @type {Integer (Int32)}
     */
    static FIXED => 2

    /**
     * This connection is regulated on a per byte basis.
     * Native name: NLM_CONNECTION_COST_VARIABLE
     * @type {Integer (Int32)}
     */
    static VARIABLE => 4

    /**
     * The connection is currently in an OverDataLimit state as it has exceeded the carrier specified data transfer limit.
     * Native name: NLM_CONNECTION_COST_OVERDATALIMIT
     * @type {Integer (Int32)}
     */
    static OVERDATALIMIT => 65536

    /**
     * The network is experiencing high traffic load and is congested.
     * Native name: NLM_CONNECTION_COST_CONGESTED
     * @type {Integer (Int32)}
     */
    static CONGESTED => 131072

    /**
     * The connection is roaming outside the network and  affiliates of the home provider.
     * Native name: NLM_CONNECTION_COST_ROAMING
     * @type {Integer (Int32)}
     */
    static ROAMING => 262144

    /**
     * The connection is approaching the data limit specified by the carrier.
     * Native name: NLM_CONNECTION_COST_APPROACHINGDATALIMIT
     * @type {Integer (Int32)}
     */
    static APPROACHINGDATALIMIT => 524288
}
