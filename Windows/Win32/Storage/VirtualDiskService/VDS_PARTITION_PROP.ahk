#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_PARTITION_INFO_MBR.ahk
#Include .\VDS_PARTITION_INFO_GPT.ahk

/**
 * Defines the properties of a partition.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-getpartitionproperties">IVdsAdvancedDisk::GetPartitionProperties</a> 
 *     and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-querypartitions">IVdsAdvancedDisk::QueryPartitions</a> 
 *     methods return this structure to report the property details of a partition.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_partition_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PARTITION_PROP extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * The styles enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_style">VDS_PARTITION_STYLE</a>. 
     *       The style is either master boot record (VDS_PST_MBR) or GUID partition table (VDS_PST_GPT). This member is the
     *       discriminant for the union.
     * @type {Integer}
     */
    PartitionStyle {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The partition flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_flag">VDS_PARTITION_FLAG</a>.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number assigned to the partition.
     * @type {Integer}
     */
    ulPartitionNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The partition offset.
     * @type {Integer}
     */
    ullOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The size of the partition in bytes.
     * @type {Integer}
     */
    ullSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {VDS_PARTITION_INFO_MBR}
     */
    Mbr{
        get {
            if(!this.HasProp("__Mbr"))
                this.__Mbr := VDS_PARTITION_INFO_MBR(32, this)
            return this.__Mbr
        }
    }

    /**
     * @type {VDS_PARTITION_INFO_GPT}
     */
    Gpt{
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := VDS_PARTITION_INFO_GPT(32, this)
            return this.__Gpt
        }
    }
}
