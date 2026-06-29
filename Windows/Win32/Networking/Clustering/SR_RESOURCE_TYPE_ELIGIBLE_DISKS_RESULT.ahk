#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SR_RESOURCE_TYPE_DISK_INFO.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SR_DISK_REPLICATION_ELIGIBLE.ahk

/**
 * Describes a set of data disks retrieved by a resource type control code operation for storage replication.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_eligible_disks_result
 * @namespace Windows.Win32.Networking.Clustering
 */
class SR_RESOURCE_TYPE_ELIGIBLE_DISKS_RESULT extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * The number of retrieved disks.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * An array that contains the retrieved disk information.
     * @type {SR_RESOURCE_TYPE_DISK_INFO}
     */
    DiskInfo {
        get {
            if(!this.HasProp("__DiskInfoProxyArray"))
                this.__DiskInfoProxyArray := Win32FixedArray(this.ptr + 4, 1, SR_RESOURCE_TYPE_DISK_INFO, "")
            return this.__DiskInfoProxyArray
        }
    }
}
