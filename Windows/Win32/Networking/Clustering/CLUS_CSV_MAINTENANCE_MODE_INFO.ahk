#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Enables or disables the maintenance mode on a cluster shared volume (CSV).
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_csv_maintenance_mode_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_CSV_MAINTENANCE_MODE_INFO {
    #StructPack 4

    /**
     * Specifies the maintenance mode for the CSV. <b>TRUE</b> enables maintenance mode, 
     *       <b>FALSE</b> disables it.
     */
    InMaintenance : BOOL

    /**
     * The volume <b>GUID</b> path of the CSV.
     */
    VolumeName : WCHAR[260]

}
