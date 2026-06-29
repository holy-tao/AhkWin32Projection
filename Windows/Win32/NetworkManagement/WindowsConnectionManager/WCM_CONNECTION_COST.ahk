#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines the connection cost type and flags.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ne-wcmapi-wcm_connection_cost
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_CONNECTION_COST {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Connection cost information is not available.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_UNKNOWN => 0

    /**
     * The connection is unlimited and has unrestricted usage constraints.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_UNRESTRICTED => 1

    /**
     * Usage counts toward a fixed allotment of data which the user has already paid for (or agreed to pay for).
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_FIXED => 2

    /**
     * The connection cost is on a per-byte basis.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_VARIABLE => 4

    /**
     * The connection has exceeded its data limit.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_OVERDATALIMIT => 65536

    /**
     * The connection is throttled due to high traffic.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_CONGESTED => 131072

    /**
     * The connection is outside of the home network.
     * 
     * <div class="alert"><b>Note</b>  The <b>WCM_CONNECTION_COST_ROAMING</b> value comes directly from  the connection source. Attempts to set it directly will fail.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_ROAMING => 262144

    /**
     * The connection is approaching its data limit.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_APPROACHINGDATALIMIT => 524288
}
