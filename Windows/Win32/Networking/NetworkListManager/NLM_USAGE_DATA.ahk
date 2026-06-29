#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * NLM_USAGE_DATA structure stores information that indicates the data usage of a plan.
 * @remarks
 * If usage is not supplied, <b>UsageInMegabytes</b> is set to <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> (0xFFFFFFFF), and <b>LastSyncTime</b> is set to 0.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ns-netlistmgr-nlm_usage_data
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct NLM_USAGE_DATA {
    #StructPack 4

    /**
     * The data usage of a plan, represented in megabytes.
     */
    UsageInMegabytes : UInt32

    /**
     * The timestamp of last time synced with carriers about the data usage stored in this structure.
     */
    LastSyncTime : FILETIME

}
