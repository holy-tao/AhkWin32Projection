#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of disk extents types. The type can be a partition, volume, or free space.
 * @remarks
 * ESP, MBR, and LDM metadata partitions are partition styles on GPT disks only.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_extent">VDS_DISK_EXTENT</a> structure includes a <b>VDS_DISK_EXTENT_TYPE</b> value as a member to indicate an existing disk extent type.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_DISK_EXTENT_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_DISK_EXTENT_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_disk_extent_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_DISK_EXTENT_TYPE extends Win32Enum {

    /**
     * An extent of any unknown partition.
     * Native name: VDS_DET_UNKNOWN
     * @type {Integer (Int32)}
     */
    static DET_UNKNOWN => 0

    /**
     * An extent of free space, including free space inside an extended partition.
     * Native name: VDS_DET_FREE
     * @type {Integer (Int32)}
     */
    static DET_FREE => 1

    /**
     * An extent of any volume.
     * Native name: VDS_DET_DATA
     * @type {Integer (Int32)}
     */
    static DET_DATA => 2

    /**
     * An extent of an OEM partition.
     * Native name: VDS_DET_OEM
     * @type {Integer (Int32)}
     */
    static DET_OEM => 3

    /**
     * An extent of an ESP partition.
     * Native name: VDS_DET_ESP
     * @type {Integer (Int32)}
     */
    static DET_ESP => 4

    /**
     * An extent of a MSR partition.
     * Native name: VDS_DET_MSR
     * @type {Integer (Int32)}
     */
    static DET_MSR => 5

    /**
     * An extent of a LDM metadata partition.
     * Native name: VDS_DET_LDM
     * @type {Integer (Int32)}
     */
    static DET_LDM => 6

    /**
     * An extent of a cluster metadata partition.
     * Native name: VDS_DET_CLUSTER
     * @type {Integer (Int32)}
     */
    static DET_CLUSTER => 7

    /**
     * An extent of unusable space on a disk. That is, space outside the four primary partitions (or three primary partitions plus one extended partition) on a basic MBR disk and space outside the dynamic disk public region.
     * Native name: VDS_DET_UNUSABLE
     * @type {Integer (Int32)}
     */
    static DET_UNUSABLE => 32767
}
