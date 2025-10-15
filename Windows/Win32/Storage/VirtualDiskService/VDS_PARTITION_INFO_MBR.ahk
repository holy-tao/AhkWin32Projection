#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Defines the details of a master boot record (MBR) partition.
 * @remarks
 * 
  * This structure is used in the <b>Mbr</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_prop">VDS_PARTITION_PROP</a> structure.
  * 
  * For information about partition types, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_partition_info_mbr
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PARTITION_INFO_MBR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Byte value indicating the partition type.
     * @type {Integer}
     */
    partitionType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * If true, the partition is active and can be booted; otherwise, the partition cannot be used to boot the computer.
     * @type {BOOLEAN}
     */
    bootIndicator{
        get {
            if(!this.HasProp("__bootIndicator"))
                this.__bootIndicator := BOOLEAN(this.ptr + 1)
            return this.__bootIndicator
        }
    }

    /**
     * If true, the operating system recognizes the partition style; otherwise, the partition style is unknown.
     * @type {BOOLEAN}
     */
    recognizedPartition{
        get {
            if(!this.HasProp("__recognizedPartition"))
                this.__recognizedPartition := BOOLEAN(this.ptr + 2)
            return this.__recognizedPartition
        }
    }

    /**
     * Reserved sectors.
     * @type {Integer}
     */
    hiddenSectors {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
