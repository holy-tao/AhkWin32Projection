#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents a cluster shared volume (CSV) during a validation operation.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_validate_csv_filename
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_VALIDATE_CSV_FILENAME {
    #StructPack 2

    /**
     * A  Unicode string that contains the volume name of the CSV. The string ends with a terminating null character.  The name provided can be either the cluster-assigned friendly name or the volume <b>GUID</b> path of the form "\\?\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\".
     */
    szFileName : WCHAR[1]

}
