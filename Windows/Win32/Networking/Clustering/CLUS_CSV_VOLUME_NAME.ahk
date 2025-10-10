#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the name of a cluster shared volume (CSV).
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_csv_volume_name
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_CSV_VOLUME_NAME extends Win32Struct
{
    static sizeof => 1056

    static packingSize => 8

    /**
     * The physical offset, in bytes, of the data on the CSV.
     * @type {Integer}
     */
    VolumeOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * A Unicode string that contains the volume name of the CSV. The string has a terminating null character.  The name provided can be either the cluster-assigned friendly name or the volume <b>GUID</b> path of the form "\\?\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\".
     * @type {String}
     */
    szVolumeName {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }

    /**
     * The root path of the CSV.
     * @type {String}
     */
    szRootPath {
        get => StrGet(this.ptr + 528, 262, "UTF-16")
        set => StrPut(value, this.ptr + 528, 262, "UTF-16")
    }
}
