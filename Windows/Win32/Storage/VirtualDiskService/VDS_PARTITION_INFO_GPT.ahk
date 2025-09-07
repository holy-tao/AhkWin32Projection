#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class VDS_PARTITION_INFO_GPT extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * GUID for the partition type.
     * @type {Pointer<Guid>}
     */
    partitionType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * GUID for the partition.
     * @type {Pointer<Guid>}
     */
    partitionId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Attributes of the partition.
     * @type {Integer}
     */
    attributes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Name of the partition.
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 24, 35, "UTF-16")
        set => StrPut(value, this.ptr + 24, 35, "UTF-16")
    }
}
