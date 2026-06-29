#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Describes a set of retrieved data disks that can be used as source sites for replication.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_query_eligible_source_datadisks
 * @namespace Windows.Win32.Networking.Clustering
 */
class SR_RESOURCE_TYPE_QUERY_ELIGIBLE_SOURCE_DATADISKS extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * The cluster resource identifier of the data disk.
     * @type {Guid}
     */
    DataDiskGuid {
        get {
            if(!this.HasProp("__DataDiskGuid"))
                this.__DataDiskGuid := Guid(0, this)
            return this.__DataDiskGuid
        }
    }

    /**
     * <b>true</b> if the result set includes disks in the available storage group.
     * @type {BOOLEAN}
     */
    IncludeAvailableStoargeDisks {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
