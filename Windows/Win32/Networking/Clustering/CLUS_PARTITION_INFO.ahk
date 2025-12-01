#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class CLUS_PARTITION_INFO extends Win32Struct
{
    static sizeof => 1120

    static packingSize => 4

    /**
     * Flags that describes the storage class resource, enumerated by the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-clusprop_piflags">CLUSPROP_PIFLAGS</a> enumeration.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Device name for the storage class resource, such as "C:". No backslash is included.
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }

    /**
     * Volume label for the storage class resource.
     * @type {String}
     */
    szVolumeLabel {
        get => StrGet(this.ptr + 524, 259, "UTF-16")
        set => StrPut(value, this.ptr + 524, 259, "UTF-16")
    }

    /**
     * Serial number of the storage class resource volume.
     * @type {Integer}
     */
    dwSerialNumber {
        get => NumGet(this, 1044, "uint")
        set => NumPut("uint", value, this, 1044)
    }

    /**
     * Value of the maximum length, in characters, of a file name component supported by the specified file 
     *       system. A file name component is the portion of a file name between backslashes.
     * @type {Integer}
     */
    rgdwMaximumComponentLength {
        get => NumGet(this, 1048, "uint")
        set => NumPut("uint", value, this, 1048)
    }

    /**
     * Value that describes the file system. One or more of the following flags are valid.
     * @type {Integer}
     */
    dwFileSystemFlags {
        get => NumGet(this, 1052, "uint")
        set => NumPut("uint", value, this, 1052)
    }

    /**
     * Name of the file system, such as "FAT" or "NTFS".
     * @type {String}
     */
    szFileSystem {
        get => StrGet(this.ptr + 1056, 31, "UTF-16")
        set => StrPut(value, this.ptr + 1056, 31, "UTF-16")
    }
}
