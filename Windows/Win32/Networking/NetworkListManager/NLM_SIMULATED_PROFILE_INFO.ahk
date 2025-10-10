#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to specify values that are used by SetSimulatedProfileInfo to override current internet connection profile values in an RDP Child Session to support the simulation of specific metered internet connection conditions.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/ns-netlistmgr-nlm_simulated_profile_info
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_SIMULATED_PROFILE_INFO extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * Name for the simulated profile.
     * @type {String}
     */
    ProfileName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * The network cost. Possible values are defined by <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_cost">NLM_CONNECTION_COST</a>.
     * @type {Integer}
     */
    cost {
        get => NumGet(this, 512, "int")
        set => NumPut("int", value, this, 512)
    }

    /**
     * The data usage.
     * @type {Integer}
     */
    UsageInMegabytes {
        get => NumGet(this, 516, "uint")
        set => NumPut("uint", value, this, 516)
    }

    /**
     * The data limit of the plan.
     * @type {Integer}
     */
    DataLimitInMegabytes {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }
}
