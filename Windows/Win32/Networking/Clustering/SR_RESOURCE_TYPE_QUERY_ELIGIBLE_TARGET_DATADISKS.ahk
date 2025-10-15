#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Describes a set of retrieved data disks that can be used as target sites for replication.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-sr_resource_type_query_eligible_target_datadisks
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_RESOURCE_TYPE_QUERY_ELIGIBLE_TARGET_DATADISKS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The cluster resource identifier of the data disk.
     * @type {Pointer<Guid>}
     */
    SourceDataDiskGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The identifier of the replication group that contains the retrieved data disks.
     * @type {Pointer<Guid>}
     */
    TargetReplicationGroupGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * <b>true</b> if the disks that are connected to the same nodes as the source disk are included in result set.
     * @type {BOOLEAN}
     */
    SkipConnectivityCheck{
        get {
            if(!this.HasProp("__SkipConnectivityCheck"))
                this.__SkipConnectivityCheck := BOOLEAN(this.ptr + 16)
            return this.__SkipConnectivityCheck
        }
    }

    /**
     * <b>true</b> if the result set includes all offline disks in the available storage group.
     * @type {BOOLEAN}
     */
    IncludeOfflineDisks{
        get {
            if(!this.HasProp("__IncludeOfflineDisks"))
                this.__IncludeOfflineDisks := BOOLEAN(this.ptr + 17)
            return this.__IncludeOfflineDisks
        }
    }
}
