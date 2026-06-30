#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SR_DISK_REPLICATION_ELIGIBLE.ahk

/**
 * Describes a set of information that indicates whether a disk is eligible for replication.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_disk_info
 * @namespace Windows.Win32.Networking.Clustering
 */
class SR_RESOURCE_TYPE_DISK_INFO extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * Indicates the reason that the disk is eligible or ineligible for replication.
     * @type {SR_DISK_REPLICATION_ELIGIBLE}
     */
    Reason {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The cluster resource identifier of the disk.
     * @type {Guid}
     */
    DiskGuid {
        get {
            if(!this.HasProp("__DiskGuid"))
                this.__DiskGuid := Guid(4, this)
            return this.__DiskGuid
        }
    }
}
