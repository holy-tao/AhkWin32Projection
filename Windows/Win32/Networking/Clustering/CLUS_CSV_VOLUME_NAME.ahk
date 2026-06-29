#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents the name of a cluster shared volume (CSV).
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_csv_volume_name
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_CSV_VOLUME_NAME {
    #StructPack 8

    /**
     * The physical offset, in bytes, of the data on the CSV.
     */
    VolumeOffset : Int64

    /**
     * A Unicode string that contains the volume name of the CSV. The string has a terminating null character.  The name provided can be either the cluster-assigned friendly name or the volume <b>GUID</b> path of the form "\\?\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\".
     */
    szVolumeName : WCHAR[260]

    /**
     * The root path of the CSV.
     */
    szRootPath : WCHAR[263]

}
