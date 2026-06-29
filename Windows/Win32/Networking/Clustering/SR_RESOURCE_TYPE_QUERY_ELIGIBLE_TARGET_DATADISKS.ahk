#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Describes a set of retrieved data disks that can be used as target sites for replication.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_query_eligible_target_datadisks
 * @namespace Windows.Win32.Networking.Clustering
 */
class SR_RESOURCE_TYPE_QUERY_ELIGIBLE_TARGET_DATADISKS extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * The cluster resource identifier of the data disk.
     * @type {Guid}
     */
    SourceDataDiskGuid {
        get {
            if(!this.HasProp("__SourceDataDiskGuid"))
                this.__SourceDataDiskGuid := Guid(0, this)
            return this.__SourceDataDiskGuid
        }
    }

    /**
     * The identifier of the replication group that contains the retrieved data disks.
     * @type {Guid}
     */
    TargetReplicationGroupGuid {
        get {
            if(!this.HasProp("__TargetReplicationGroupGuid"))
                this.__TargetReplicationGroupGuid := Guid(16, this)
            return this.__TargetReplicationGroupGuid
        }
    }

    /**
     * <b>true</b> if the disks that are connected to the same nodes as the source disk are included in result set.
     * @type {BOOLEAN}
     */
    SkipConnectivityCheck {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * <b>true</b> if the result set includes all offline disks in the available storage group.
     * @type {BOOLEAN}
     */
    IncludeOfflineDisks {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }
}
