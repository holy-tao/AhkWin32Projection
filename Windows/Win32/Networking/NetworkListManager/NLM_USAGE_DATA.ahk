#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * NLM_USAGE_DATA structure stores information that indicates the data usage of a plan.
 * @remarks
 * If usage is not supplied, <b>UsageInMegabytes</b> is set to <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> (0xFFFFFFFF), and <b>LastSyncTime</b> is set to 0.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ns-netlistmgr-nlm_usage_data
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_USAGE_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The data usage of a plan, represented in megabytes.
     * @type {Integer}
     */
    UsageInMegabytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The timestamp of last time synced with carriers about the data usage stored in this structure.
     * @type {FILETIME}
     */
    LastSyncTime{
        get {
            if(!this.HasProp("__LastSyncTime"))
                this.__LastSyncTime := FILETIME(8, this)
            return this.__LastSyncTime
        }
    }
}
