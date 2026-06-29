#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NLM_CONNECTION_COST.ahk" { NLM_CONNECTION_COST }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Used to specify values that are used by SetSimulatedProfileInfo to override current internet connection profile values in an RDP Child Session to support the simulation of specific metered internet connection conditions.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ns-netlistmgr-nlm_simulated_profile_info
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct NLM_SIMULATED_PROFILE_INFO {
    #StructPack 4

    /**
     * Name for the simulated profile.
     */
    ProfileName : WCHAR[256]

    /**
     * The network cost. Possible values are defined by <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_cost">NLM_CONNECTION_COST</a>.
     */
    cost : NLM_CONNECTION_COST

    /**
     * The data usage.
     */
    UsageInMegabytes : UInt32

    /**
     * The data limit of the plan.
     */
    DataLimitInMegabytes : UInt32

}
