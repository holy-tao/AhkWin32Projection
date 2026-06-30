#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

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
class VDS_PARTITION_INFO_GPT extends Win32Struct {
    static sizeof => 112

    static packingSize => 8

    /**
     * GUID for the partition type.
     * @type {Guid}
     */
    partitionType {
        get {
            if(!this.HasProp("__partitionType"))
                this.__partitionType := Guid(0, this)
            return this.__partitionType
        }
    }

    /**
     * GUID for the partition.
     * @type {Guid}
     */
    partitionId {
        get {
            if(!this.HasProp("__partitionId"))
                this.__partitionId := Guid(16, this)
            return this.__partitionId
        }
    }

    /**
     * Attributes of the partition.
     * @type {Integer}
     */
    attributes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Name of the partition.
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 40, 35, "UTF-16")
        set => StrPut(value, this.ptr + 40, 35, "UTF-16")
    }
}
