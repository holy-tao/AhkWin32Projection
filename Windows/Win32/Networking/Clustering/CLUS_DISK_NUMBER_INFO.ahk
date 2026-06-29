#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents information about the disk number of a physical disk.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_disk_number_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_DISK_NUMBER_INFO {
    #StructPack 4

    /**
     * The disk number of the disk.
     */
    DiskNumber : UInt32

    /**
     * The size of the disk sectors, in bytes.
     */
    BytesPerSector : UInt32

}
