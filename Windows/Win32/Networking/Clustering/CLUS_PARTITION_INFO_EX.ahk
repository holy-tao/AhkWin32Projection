#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes a storage class resource volume and file system.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_partition_info_ex
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_PARTITION_INFO_EX {
    #StructPack 8

    /**
     * Flags that describes the storage class resource, enumerated by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-clusprop_piflags">CLUSPROP_PIFLAGS</a> enumeration.
     */
    dwFlags : UInt32

    /**
     * Device name for the storage class resource, such as "C:". No backslashes are included.
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
     * Maximum length, in characters, of a file name component supported by the specified file system. A file name 
     *        component is that portion of a file name between backslashes.
     */
    rgdwMaximumComponentLength : UInt32

    /**
     * Flags that describes the file system. One or more of the following flags are valid.
     */
    dwFileSystemFlags : UInt32

    /**
     * Name of the file system, such as "FAT" or "NTFS".
     */
    szFileSystem : WCHAR[32]

    /**
     * Specifies the total size, in bytes, of the volume. This value may not be properly aligned and should be accessed using 
     *        <b>UNALIGNED</b> pointers.
     */
    TotalSizeInBytes : Int64

    /**
     * Specifies the size, in bytes, of the unallocated space on the volume. This value may not be properly aligned and should be accessed using 
     *        <b>UNALIGNED</b> pointers.
     */
    FreeSizeInBytes : Int64

    /**
     * The device number
     */
    DeviceNumber : UInt32

    /**
     * The partition number.
     */
    PartitionNumber : UInt32

    /**
     * The globally unique identifier associated with the volume.
     */
    VolumeGuid : Guid

}
