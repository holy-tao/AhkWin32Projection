#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies the existing and target drive letter for a disk drive on a node.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_storage_remap_driveletter
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_STORAGE_REMAP_DRIVELETTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A 32-bit bitmask indicating the drive letter to be changed. The least significant bit represents the drive letter 'A' through bit 25, which represents the drive letter 'Z'.
     * @type {Integer}
     */
    CurrentDriveLetterMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 32-bit bitmask indicating the new drive letter for the disk drive that corresponds to the drive letter specified in CurrentDriveLetterMask.
     * @type {Integer}
     */
    TargetDriveLetterMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
