#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the connection cost type and flags.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ne-wcmapi-wcm_connection_cost
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
class WCM_CONNECTION_COST extends Win32Enum {

    /**
     * Connection cost information is not available.
     * Native name: WCM_CONNECTION_COST_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The connection is unlimited and has unrestricted usage constraints.
     * Native name: WCM_CONNECTION_COST_UNRESTRICTED
     * @type {Integer (Int32)}
     */
    static UNRESTRICTED => 1

    /**
     * Usage counts toward a fixed allotment of data which the user has already paid for (or agreed to pay for).
     * Native name: WCM_CONNECTION_COST_FIXED
     * @type {Integer (Int32)}
     */
    static FIXED => 2

    /**
     * The connection cost is on a per-byte basis.
     * Native name: WCM_CONNECTION_COST_VARIABLE
     * @type {Integer (Int32)}
     */
    static VARIABLE => 4

    /**
     * The connection has exceeded its data limit.
     * Native name: WCM_CONNECTION_COST_OVERDATALIMIT
     * @type {Integer (Int32)}
     */
    static OVERDATALIMIT => 65536

    /**
     * The connection is throttled due to high traffic.
     * Native name: WCM_CONNECTION_COST_CONGESTED
     * @type {Integer (Int32)}
     */
    static CONGESTED => 131072

    /**
     * The connection is outside of the home network.
     * 
     * <div class="alert"><b>Note</b>  The <b>WCM_CONNECTION_COST_ROAMING</b> value comes directly from  the connection source. Attempts to set it directly will fail.</div>
     * <div> </div>
     * Native name: WCM_CONNECTION_COST_ROAMING
     * @type {Integer (Int32)}
     */
    static ROAMING => 262144

    /**
     * The connection is approaching its data limit.
     * Native name: WCM_CONNECTION_COST_APPROACHINGDATALIMIT
     * @type {Integer (Int32)}
     */
    static APPROACHINGDATALIMIT => 524288
}
