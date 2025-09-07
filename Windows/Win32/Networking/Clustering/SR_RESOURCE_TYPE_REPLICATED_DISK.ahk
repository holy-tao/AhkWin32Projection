#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a replicated disk.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_replicated_disk
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_RESOURCE_TYPE_REPLICATED_DISK extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * The type of the replicated disk.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The cluster resource identifier of the disk.
     * @type {Pointer<Guid>}
     */
    ClusterDiskResourceGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The replication group identifier of the disk.
     * @type {Pointer<Guid>}
     */
    ReplicationGroupId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The name of the replication group..
     * @type {String}
     */
    ReplicationGroupName {
        get => StrGet(this.ptr + 24, 259, "UTF-16")
        set => StrPut(value, this.ptr + 24, 259, "UTF-16")
    }
}
