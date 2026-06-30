#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SR_REPLICATED_DISK_TYPE.ahk

/**
 * Represents a replicated disk.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_replicated_disk
 * @namespace Windows.Win32.Networking.Clustering
 */
class SR_RESOURCE_TYPE_REPLICATED_DISK extends Win32Struct {
    static sizeof => 556

    static packingSize => 4

    /**
     * The type of the replicated disk.
     * @type {SR_REPLICATED_DISK_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The cluster resource identifier of the disk.
     * @type {Guid}
     */
    ClusterDiskResourceGuid {
        get {
            if(!this.HasProp("__ClusterDiskResourceGuid"))
                this.__ClusterDiskResourceGuid := Guid(4, this)
            return this.__ClusterDiskResourceGuid
        }
    }

    /**
     * The replication group identifier of the disk.
     * @type {Guid}
     */
    ReplicationGroupId {
        get {
            if(!this.HasProp("__ReplicationGroupId"))
                this.__ReplicationGroupId := Guid(20, this)
            return this.__ReplicationGroupId
        }
    }

    /**
     * The name of the replication group..
     * @type {String}
     */
    ReplicationGroupName {
        get => StrGet(this.ptr + 36, 259, "UTF-16")
        set => StrPut(value, this.ptr + 36, 259, "UTF-16")
    }
}
