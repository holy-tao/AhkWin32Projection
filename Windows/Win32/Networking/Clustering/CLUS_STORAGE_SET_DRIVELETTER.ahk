#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Supplies drive letter information for a disk partition associated with a storage class resource.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_storage_set_driveletter
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_STORAGE_SET_DRIVELETTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A 32-bit integer that indicates a partition on the storage device.
     * @type {Integer}
     */
    PartitionNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 32-bit integer bitmask that indicates either the new drive letter of the partition or that the partition's drive letter should be removed. Each bit represents a drive letter where bit 0 represents 'A', bit 1 represents 'B', and so forth through bit 25. Bits 26 through 31 are ignored. A value of zero indicates that the drive letter should be removed.
     * @type {Integer}
     */
    DriveLetterMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
