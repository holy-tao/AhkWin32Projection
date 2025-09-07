#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DISK_SPACE_INFORMATION structure contains information about the disk space for a particular volume.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-disk_space_information
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class DISK_SPACE_INFORMATION extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The `ActualTotalAllocationUnits` is the total volume size without considering Quota setting.
     * @type {Integer}
     */
    ActualTotalAllocationUnits {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The `ActualTotalAllocationUnits` is the available space for the volume without considering Quota setting.
     * @type {Integer}
     */
    ActualAvailableAllocationUnits {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The `ActualPoolUnavailableAllocationUnits` is the unavailable space for the volume due to insufficient free pool space
     * @type {Integer}
     */
    ActualPoolUnavailableAllocationUnits {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The `CallerTotalAllocationUnits` is the total volume size limited by Quota setting.
     * @type {Integer}
     */
    CallerTotalAllocationUnits {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The `CallerAvailableAllocationUnits` is the available space for the volume limited by Quota setting.
     * @type {Integer}
     */
    CallerAvailableAllocationUnits {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The `CallerAvailableAllocationUnits` is the unavailable space for the volume due to insufficient free pool space.
     * @type {Integer}
     */
    CallerPoolUnavailableAllocationUnits {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The used space of the volume.
     * @type {Integer}
     */
    UsedAllocationUnits {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Total reserved space.
     * @type {Integer}
     */
    TotalReservedAllocationUnits {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A special type of reserved space for per-volume storage reserve. This is included in the `TotalReservedAllocationUnits`.
     * @type {Integer}
     */
    VolumeStorageReserveAllocationUnits {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The space that has been committed by storage pool but has not been allocated by file system.
     * @type {Integer}
     */
    AvailableCommittedAllocationUnits {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Available space in corresponding storage pool. If the volume is not a spaces volume, the `PoolAvailableAllocationUnits` is set to `0`.
     * @type {Integer}
     */
    PoolAvailableAllocationUnits {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of sectors per allocation unit for the volume.
     * @type {Integer}
     */
    SectorsPerAllocationUnit {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The number of bytes per sector for the volume.
     * @type {Integer}
     */
    BytesPerSector {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}
