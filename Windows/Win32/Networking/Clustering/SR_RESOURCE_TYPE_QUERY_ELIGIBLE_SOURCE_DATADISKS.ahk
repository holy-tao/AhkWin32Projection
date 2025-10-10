#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a set of retrieved data disks that can be used as source sites for replication.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-sr_resource_type_query_eligible_source_datadisks
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_RESOURCE_TYPE_QUERY_ELIGIBLE_SOURCE_DATADISKS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The cluster resource identifier of the data disk.
     * @type {Pointer<Guid>}
     */
    DataDiskGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <b>true</b> if the result set includes disks in the available storage group.
     * @type {Integer}
     */
    IncludeAvailableStoargeDisks {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
