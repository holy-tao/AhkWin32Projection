#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents information about a cluster shared volume (CSV).
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_csv_volume_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_CSV_VOLUME_INFO extends Win32Struct
{
    static sizeof => 640

    static packingSize => 8

    /**
     * The physical offset, in bytes, of the data on the CSV.
     * @type {Integer}
     */
    VolumeOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The partition number of the CSV.
     * @type {Integer}
     */
    PartitionNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_csv_volume_fault_state">CLUSTER_CSV_VOLUME_FAULT_STATE</a> enumeration value that specifies the fault state of the CSV.
     * @type {Integer}
     */
    FaultState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_shared_volume_backup_state">CLUSTER_SHARED_VOLUME_BACKUP_STATE</a> enumeration value that specifies the state of the CSV backup.
     * @type {Integer}
     */
    BackupState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The friendly name of the CSV.
     * @type {String}
     */
    szVolumeFriendlyName {
        get => StrGet(this.ptr + 20, 259, "UTF-16")
        set => StrPut(value, this.ptr + 20, 259, "UTF-16")
    }

    /**
     * The volume <b>GUID</b> path of the CSV.
     * @type {String}
     */
    szVolumeName {
        get => StrGet(this.ptr + 540, 49, "UTF-16")
        set => StrPut(value, this.ptr + 540, 49, "UTF-16")
    }
}
