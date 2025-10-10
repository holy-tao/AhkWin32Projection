#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DISK_GEOMETRY.ahk

/**
 * Describes the extended geometry of disk devices and media.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-disk_geometry_ex
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_GEOMETRY_EX extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A [**DISK_GEOMETRY**](ns-winioctl-disk_geometry.md) structure.
     * @type {DISK_GEOMETRY}
     */
    Geometry{
        get {
            if(!this.HasProp("__Geometry"))
                this.__Geometry := DISK_GEOMETRY(this.ptr + 0)
            return this.__Geometry
        }
    }

    /**
     * The disk size, in bytes. See [**LARGE_INTEGER**](../winnt/ns-winnt-large_integer-r1.md).
     * @type {Integer}
     */
    DiskSize {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Any additional data. For more information, see Remarks.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
