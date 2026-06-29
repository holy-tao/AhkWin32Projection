#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Defines details of a GUID partition table (GPT) partition.
 * @remarks
 * This structure is used in the <b>Gpt</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_prop">VDS_PARTITION_PROP</a> structure.
 * 
 *  A GPT table is sector-aligned.
 * 
 * For information about partition types and attributes, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_partition_info_gpt
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PARTITION_INFO_GPT {
    #StructPack 8

    /**
     * GUID for the partition type.
     */
    partitionType : Guid

    /**
     * GUID for the partition.
     */
    partitionId : Guid

    /**
     * Attributes of the partition.
     */
    attributes : Int64

    /**
     * Name of the partition.
     */
    name : WCHAR[36]

}
