#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes parameters to be used when changing a partition's type.
 * @remarks
 * 
  * For information about partition types, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-change_partition_type_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class CHANGE_PARTITION_TYPE_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_style">VDS_PARTITION_STYLE</a> enumeration that describes the disk's partition style.
     * @type {Integer}
     */
    style {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _MbrPartInfo extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        partitionType {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
    }

    class _GptPartInfo extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        partitionType {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {_MbrPartInfo}
     */
    MbrPartInfo{
        get {
            if(!this.HasProp("__MbrPartInfo"))
                this.__MbrPartInfo := %this.__Class%._MbrPartInfo(8, this)
            return this.__MbrPartInfo
        }
    }

    /**
     * @type {_GptPartInfo}
     */
    GptPartInfo{
        get {
            if(!this.HasProp("__GptPartInfo"))
                this.__GptPartInfo := %this.__Class%._GptPartInfo(8, this)
            return this.__GptPartInfo
        }
    }
}
