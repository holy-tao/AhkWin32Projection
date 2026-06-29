#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains data describing a storage class resource volume and file system. It is used as the data member of a CLUSPROP_PARTITION_INFO structure and as the return value of some control code operations.
 * @remarks
 * A <b>CLUS_PARTITION_INFO</b> structure can be returned by 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcecontrol">ClusterResourceControl</a> when the 
 *      <i>dwControlCode</i> parameter is set to 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO</a> 
 *      and can be returned by 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypecontrol">ClusterResourceTypeControl</a> when 
 *      <i>dwControlCode</i> is set to 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-available-disks">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS</a>.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_partition_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_PARTITION_INFO {
    #StructPack 4

    /**
     * Flags that describes the storage class resource, enumerated by the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-clusprop_piflags">CLUSPROP_PIFLAGS</a> enumeration.
     */
    dwFlags : UInt32

    /**
     * Device name for the storage class resource, such as "C:". No backslash is included.
     */
    szDeviceName : WCHAR[260]

    /**
     * Volume label for the storage class resource.
     */
    szVolumeLabel : WCHAR[260]

    /**
     * Serial number of the storage class resource volume.
     */
    dwSerialNumber : UInt32

    /**
     * Value of the maximum length, in characters, of a file name component supported by the specified file 
     *       system. A file name component is the portion of a file name between backslashes.
     */
    rgdwMaximumComponentLength : UInt32

    /**
     * Value that describes the file system. One or more of the following flags are valid.
     */
    dwFileSystemFlags : UInt32

    /**
     * Name of the file system, such as "FAT" or "NTFS".
     */
    szFileSystem : WCHAR[32]

}
