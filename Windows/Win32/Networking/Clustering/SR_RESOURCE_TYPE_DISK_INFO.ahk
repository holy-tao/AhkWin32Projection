#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a set of information that indicates whether a disk is eligible for replication.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-sr_resource_type_disk_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_RESOURCE_TYPE_DISK_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates the reason that the disk is eligible or ineligible for replication.
     * @type {Integer}
     */
    Reason {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The cluster resource identifier of the disk.
     * @type {Pointer<Guid>}
     */
    DiskGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
