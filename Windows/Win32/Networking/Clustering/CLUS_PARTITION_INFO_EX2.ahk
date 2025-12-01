#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the disk partition information of a storage class resource.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_partition_info_ex2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_PARTITION_INFO_EX2 extends Win32Struct
{
    static sizeof => 536

    static packingSize => 8

    /**
     * The globally unique identifier (GUID) of the partition.
     * @type {Pointer<Guid>}
     */
    GptPartitionId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The name of the partition.
     * @type {String}
     */
    szPartitionName {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }

    /**
     * A flag that indicates whether BitLocker encryption is enabled on the partition.
     * @type {Integer}
     */
    EncryptionFlags {
        get => NumGet(this, 528, "uint")
        set => NumPut("uint", value, this, 528)
    }
}
