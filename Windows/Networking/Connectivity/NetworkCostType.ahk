#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values for cost policies on a network connection.
 * @remarks
 * Use [ConnectionProfile.GetConnectionCost](connectionprofile_getconnectioncost_2051899034.md) to obtain the
 * [ConnectionCost](connectioncost.md) object and inspect its properties (`NetworkCostType`, `Roaming`, `OverDataLimit`,
 * `ApproachingDataLimit`, `BackgroundDataUsageRestricted`) before deciding how aggressively to transfer data. Evaluate flags
 * individually; do not rely solely on `NetworkCostType` transitions.
 * 
 * Scenario guidance:
 * 
 * 1. Unrestricted: Perform full-fidelity sync operations unless Roaming is true (still respect user preferences while
 *    roaming). BackgroundDataUsageRestricted can still require throttling even if unrestricted.
 * 2. Fixed: Use conservative background transfer sizes; respect MaxTransferSizeInMegabytes if provided via
 *    DataPlanStatus. Provide progressive disclosure for large optional downloads.
 * 3. Variable: Treat similar to a fixed plan near its limit. Batch opportunistically and give users a deferral option
 *    for high-volume tasks.
 * 4. ApproachingDataLimit: Preemptively reduce quality (bitrate, resolution) and surface a subtle UI indicator. Offer a
 *    user override for critical tasks.
 * 5. OverDataLimit: Pause non-essential background sync. Require explicit user action to proceed with large transfers.
 * 6. BackgroundDataUsageRestricted: Defer background-only telemetry or sync; user-initiated foreground actions should
 *    proceed normally.
 * 7. Roaming: Avoid silent large downloads; compress or batch where possible even if NetworkCostType is Unrestricted.
 * 8. Streaming / adaptive content: Dynamically target lower initial bitrate and ramp cautiously when any of
 *    ApproachingDataLimit, OverDataLimit, Roaming, or BackgroundDataUsageRestricted is active.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkcosttype
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkCostType extends Win32Enum{

    /**
     * Cost information is not available.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The connection is unlimited and has unrestricted usage charges and capacity constraints.
     * @type {Integer (Int32)}
     */
    static Unrestricted => 1

    /**
     * The use of this connection is unrestricted up to a specific limit.
     * @type {Integer (Int32)}
     */
    static Fixed => 2

    /**
     * The connection is costed on a per-byte basis.
     * @type {Integer (Int32)}
     */
    static Variable => 3
}
