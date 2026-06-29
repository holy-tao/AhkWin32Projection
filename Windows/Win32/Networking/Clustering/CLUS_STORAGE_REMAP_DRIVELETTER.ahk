#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the existing and target drive letter for a disk drive on a node.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_storage_remap_driveletter
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_STORAGE_REMAP_DRIVELETTER {
    #StructPack 4

    /**
     * A 32-bit bitmask indicating the drive letter to be changed. The least significant bit represents the drive letter 'A' through bit 25, which represents the drive letter 'Z'.
     */
    CurrentDriveLetterMask : UInt32

    /**
     * A 32-bit bitmask indicating the new drive letter for the disk drive that corresponds to the drive letter specified in CurrentDriveLetterMask.
     */
    TargetDriveLetterMask : UInt32

}
