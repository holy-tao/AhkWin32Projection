#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the roaming states.
 * @remarks
 * `RoamingStates` values appear on [ConnectionCost.Roaming](connectioncost_roaming.md). The flag indicates whether the
 * current connection is incurring roaming fees. Treat `Roaming` as a warning signal rather than an automatic off switch; a
 * user might consciously continue foreground work even when roaming.
 * 
 * Apps should pair the roaming state with [NetworkCostType](networkcosttype.md) and the various
 * [ConnectionCost](connectioncost.md) limit indicators to decide how aggressively to sync data.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.roamingstates
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class RoamingStates extends Win32BitflagEnum{

    /**
     * No roaming information.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The connection is not currently roaming.
     * @type {Integer (UInt32)}
     */
    static NotRoaming => 1

    /**
     * The connection is currently roaming.
     * @type {Integer (UInt32)}
     */
    static Roaming => 2
}
