#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains directory information for a file. (FILE_STORAGE_INFO)
 * @remarks
 * If a volume is built on top of storage devices with different properties (for example a mirrored, spanned, 
 *     striped, or RAID configuration) the sizes returned are those of the largest size of any of the underlying storage 
 *     devices.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_storage_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_STORAGE_INFO extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Logical bytes per sector  reported by physical storage. This is the smallest size for which uncached I/O is 
     *       supported.
     * @type {Integer}
     */
    LogicalBytesPerSector {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Bytes per sector for atomic writes. Writes smaller than this may require a read before the entire block can 
     *       be written atomically.
     * @type {Integer}
     */
    PhysicalBytesPerSectorForAtomicity {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Bytes per sector for optimal performance for writes.
     * @type {Integer}
     */
    PhysicalBytesPerSectorForPerformance {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This is the size of the block used for atomicity by the file system. This may be a trade-off between the 
     *       optimal size of the physical media and one that is easier to adapt existing code and structures.
     * @type {Integer}
     */
    FileSystemEffectivePhysicalBytesPerSectorForAtomicity {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * This member can contain combinations of flags specifying information about the alignment of the 
     *       storage.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STORAGE_INFO_FLAGS_ALIGNED_DEVICE"></a><a id="storage_info_flags_aligned_device"></a><dl>
     * <dt><b>STORAGE_INFO_FLAGS_ALIGNED_DEVICE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, this flag indicates that the logical sectors of the storage device are aligned to physical 
     *         sector boundaries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STORAGE_INFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE____"></a><a id="storage_info_flags_partition_aligned_on_device____"></a><dl>
     * <dt><b>STORAGE_INFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE    </b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, this flag indicates that the partition is aligned to physical sector boundaries on the 
     *         storage device.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Logical sector offset within the first physical sector where the first logical sector is placed, in bytes. 
     *       If this value is set to <b>STORAGE_INFO_OFFSET_UNKNOWN</b> (0xffffffff), there was 
     *       insufficient information to compute this field.
     * @type {Integer}
     */
    ByteOffsetForSectorAlignment {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset used to align the partition to a physical sector boundary on the storage device, in bytes. If this 
     *       value is set to <b>STORAGE_INFO_OFFSET_UNKNOWN</b> (0xffffffff), there was insufficient 
     *       information to compute this field.
     * @type {Integer}
     */
    ByteOffsetForPartitionAlignment {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
