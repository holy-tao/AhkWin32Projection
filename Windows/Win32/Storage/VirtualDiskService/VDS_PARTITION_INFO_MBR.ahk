#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Defines the details of a master boot record (MBR) partition.
 * @remarks
 * This structure is used in the <b>Mbr</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_prop">VDS_PARTITION_PROP</a> structure.
 * 
 * For information about partition types, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_partition_info_mbr
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PARTITION_INFO_MBR {
    #StructPack 4

    /**
     * Byte value indicating the partition type.
     */
    partitionType : Int8

    /**
     * If true, the partition is active and can be booted; otherwise, the partition cannot be used to boot the computer.
     */
    bootIndicator : BOOLEAN

    /**
     * If true, the operating system recognizes the partition style; otherwise, the partition style is unknown.
     */
    recognizedPartition : BOOLEAN

    /**
     * Reserved sectors.
     */
    hiddenSectors : UInt32

}
