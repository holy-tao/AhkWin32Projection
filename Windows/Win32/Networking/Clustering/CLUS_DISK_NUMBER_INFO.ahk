#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents information about the disk number of a physical disk.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_disk_number_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_DISK_NUMBER_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The disk number of the disk.
     * @type {Integer}
     */
    DiskNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the disk sectors, in bytes.
     * @type {Integer}
     */
    BytesPerSector {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
