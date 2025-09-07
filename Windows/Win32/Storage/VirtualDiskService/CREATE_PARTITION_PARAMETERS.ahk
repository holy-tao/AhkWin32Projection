#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the partition parameters of a partition style. (CREATE_PARTITION_PARAMETERS)
 * @remarks
 * The 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-createpartition">IVdsAdvancedDisk::CreatePartition</a> 
  *     method passes this structure as an argument to specify a set of parameters.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-create_partition_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class CREATE_PARTITION_PARAMETERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    style {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    partitionType {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    bootIndicator {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Pointer<Guid>}
     */
    partitionId {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    attributes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 28, 35, "UTF-16")
        set => StrPut(value, this.ptr + 28, 35, "UTF-16")
    }
}
