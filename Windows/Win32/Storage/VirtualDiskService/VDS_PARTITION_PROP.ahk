#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_PARTITION_INFO_MBR.ahk" { VDS_PARTITION_INFO_MBR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\VDS_PARTITION_STYLE.ahk" { VDS_PARTITION_STYLE }
#Import ".\VDS_PARTITION_INFO_GPT.ahk" { VDS_PARTITION_INFO_GPT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Defines the properties of a partition.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-getpartitionproperties">IVdsAdvancedDisk::GetPartitionProperties</a> 
 *     and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-querypartitions">IVdsAdvancedDisk::QueryPartitions</a> 
 *     methods return this structure to report the property details of a partition.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_partition_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PARTITION_PROP {
    #StructPack 8

    /**
     * The styles enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_style">VDS_PARTITION_STYLE</a>. 
     *       The style is either master boot record (VDS_PST_MBR) or GUID partition table (VDS_PST_GPT). This member is the
     *       discriminant for the union.
     */
    PartitionStyle : VDS_PARTITION_STYLE

    /**
     * The partition flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_flag">VDS_PARTITION_FLAG</a>.
     */
    ulFlags : UInt32

    /**
     * The number assigned to the partition.
     */
    ulPartitionNumber : UInt32

    /**
     * The partition offset.
     */
    ullOffset : Int64

    /**
     * The size of the partition in bytes.
     */
    ullSize : Int64

    Mbr : VDS_PARTITION_INFO_MBR

    static __New() {
        DefineProp(this.Prototype, 'Gpt', { type: VDS_PARTITION_INFO_GPT, offset: 32 })
        this.DeleteProp("__New")
    }
}
