#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Enables or disables the maintenance mode on a cluster shared volume (CSV).
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_csv_maintenance_mode_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_CSV_MAINTENANCE_MODE_INFO extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * Specifies the maintenance mode for the CSV. <b>TRUE</b> enables maintenance mode, 
     *       <b>FALSE</b> disables it.
     * @type {Integer}
     */
    InMaintenance {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The volume <b>GUID</b> path of the CSV.
     * @type {String}
     */
    VolumeName {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }
}
