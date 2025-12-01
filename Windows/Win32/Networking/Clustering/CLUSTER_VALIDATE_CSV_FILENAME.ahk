#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a cluster shared volume (CSV) during a validation operation.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_validate_csv_filename
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_VALIDATE_CSV_FILENAME extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * A  Unicode string that contains the volume name of the CSV. The string ends with a terminating null character.  The name provided can be either the cluster-assigned friendly name or the volume <b>GUID</b> path of the form "\\?\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\".
     * @type {String}
     */
    szFileName {
        get => StrGet(this.ptr + 0, 0, "UTF-16")
        set => StrPut(value, this.ptr + 0, 0, "UTF-16")
    }
}
