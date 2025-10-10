#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a storage class resource volume and file system.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_partition_info_ex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_PARTITION_INFO_EX extends Win32Struct
{
    static sizeof => 1152

    static packingSize => 8

    /**
     * Flags that describes the storage class resource, enumerated by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-clusprop_piflags">CLUSPROP_PIFLAGS</a> enumeration.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Device name for the storage class resource, such as "C:". No backslashes are included.
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
     * Maximum length, in characters, of a file name component supported by the specified file system. A file name 
     *        component is that portion of a file name between backslashes.
     * @type {Integer}
     */
    rgdwMaximumComponentLength {
        get => NumGet(this, 1048, "uint")
        set => NumPut("uint", value, this, 1048)
    }

    /**
     * Flags that describes the file system. One or more of the following flags are valid.
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

    /**
     * Specifies the total size, in bytes, of the volume. This value may not be properly aligned and should be accessed using 
     *        <b>UNALIGNED</b> pointers.
     * @type {Integer}
     */
    TotalSizeInBytes {
        get => NumGet(this, 1120, "uint")
        set => NumPut("uint", value, this, 1120)
    }

    /**
     * Specifies the size, in bytes, of the unallocated space on the volume. This value may not be properly aligned and should be accessed using 
     *        <b>UNALIGNED</b> pointers.
     * @type {Integer}
     */
    FreeSizeInBytes {
        get => NumGet(this, 1128, "uint")
        set => NumPut("uint", value, this, 1128)
    }

    /**
     * The device number
     * @type {Integer}
     */
    DeviceNumber {
        get => NumGet(this, 1136, "uint")
        set => NumPut("uint", value, this, 1136)
    }

    /**
     * The partition number.
     * @type {Integer}
     */
    PartitionNumber {
        get => NumGet(this, 1140, "uint")
        set => NumPut("uint", value, this, 1140)
    }

    /**
     * The globally unique identifier associated with the volume.
     * @type {Pointer<Guid>}
     */
    VolumeGuid {
        get => NumGet(this, 1144, "ptr")
        set => NumPut("ptr", value, this, 1144)
    }
}
