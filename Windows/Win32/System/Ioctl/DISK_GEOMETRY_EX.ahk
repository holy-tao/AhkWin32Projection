#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISK_GEOMETRY.ahk" { DISK_GEOMETRY }
#Import ".\MEDIA_TYPE.ahk" { MEDIA_TYPE }

/**
 * Describes the extended geometry of disk devices and media.
 * @remarks
 * **DISK_GEOMETRY_EX** is a variable-length structure composed of a [**DISK_GEOMETRY**](ns-winioctl-disk_geometry.md) structure followed by a [**DISK_PARTITION_INFO**](ns-winioctl-disk_partition_info.md) structure and a [**DISK_DETECTION_INFO**](ns-winioctl-disk_detection_info.md) structure. Because the detection information is not at a fixed location within the **DISK_GEOMETRY_EX** structure, use the following macro to access the **DISK_DETECTION_INFO** structure.
 * 
 * ```cpp
 * PDISK_DETECTION_INFO DiskGeometryGetDetect(
 *   PDISK_GEOMETRY_EX Geometry
 * );
 * ```
 * 
 * Similarly, use the following macro to access the [**DISK_PARTITION_INFO**](ns-winioctl-disk_partition_info.md) structure.
 * 
 * ```cpp
 * PDISK_PARTITION_INFO DiskGeometryGetPartition(
 *   PDISK_GEOMETRY_EX Geometry
 * );
 * ```
 * 
 * The information returned does not include the number of partitions nor the partition information contained in the [**DISK_PARTITION_INFO**](ns-winioctl-disk_partition_info.md) structure. To obtain this information, use the [**IOCTL_DISK_GET_DRIVE_LAYOUT_EX**](ni-winioctl-ioctl_disk_get_drive_layout_ex.md) control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_geometry_ex
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_GEOMETRY_EX {
    #StructPack 8

    /**
     * A [**DISK_GEOMETRY**](ns-winioctl-disk_geometry.md) structure.
     */
    Geometry : DISK_GEOMETRY

    /**
     * The disk size, in bytes. See [**LARGE_INTEGER**](../winnt/ns-winnt-large_integer-r1.md).
     */
    DiskSize : Int64

    /**
     * Any additional data. For more information, see Remarks.
     */
    Data : Int8[1]

}
