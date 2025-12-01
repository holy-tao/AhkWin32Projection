#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SR_RESOURCE_TYPE_REPLICATED_DISK.ahk

/**
 * Describes a retrieved set of replicated disks.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-sr_resource_type_replicated_disks_result
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_RESOURCE_TYPE_REPLICATED_DISKS_RESULT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of replicated disks in the result set.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The retrieved array of replicated disks.
     * @type {Array<SR_RESOURCE_TYPE_REPLICATED_DISK>}
     */
    ReplicatedDisks{
        get {
            if(!this.HasProp("__ReplicatedDisksProxyArray"))
                this.__ReplicatedDisksProxyArray := Win32FixedArray(this.ptr + 8, 1, SR_RESOURCE_TYPE_REPLICATED_DISK, "")
            return this.__ReplicatedDisksProxyArray
        }
    }
}
