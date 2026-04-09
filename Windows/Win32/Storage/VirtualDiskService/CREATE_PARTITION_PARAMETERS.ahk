#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_PARTITION_STYLE.ahk

/**
 * Defines the partition parameters of a partition style. (CREATE_PARTITION_PARAMETERS)
 * @remarks
 * The 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-createpartition">IVdsAdvancedDisk::CreatePartition</a> 
 *     method passes this structure as an argument to specify a set of parameters.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-create_partition_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class CREATE_PARTITION_PARAMETERS extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {VDS_PARTITION_STYLE}
     */
    style {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _MbrPartInfo extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        /**
         * @type {Integer}
         */
        partitionType {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {BOOLEAN}
         */
        bootIndicator {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    }

    class _GptPartInfo extends Win32Struct {
        static sizeof => 96
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        partitionType {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        partitionId {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }

        /**
         * @type {Integer}
         */
        attributes {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }

        /**
         * @type {String}
         */
        name {
            get => StrGet(this.ptr + 24, 35, "UTF-16")
            set => StrPut(value, this.ptr + 24, 35, "UTF-16")
        }
    }

    /**
     * @type {_MbrPartInfo}
     */
    MbrPartInfo {
        get {
            if(!this.HasProp("__MbrPartInfo"))
                this.__MbrPartInfo := CREATE_PARTITION_PARAMETERS._MbrPartInfo(8, this)
            return this.__MbrPartInfo
        }
    }

    /**
     * @type {_GptPartInfo}
     */
    GptPartInfo {
        get {
            if(!this.HasProp("__GptPartInfo"))
                this.__GptPartInfo := CREATE_PARTITION_PARAMETERS._GptPartInfo(8, this)
            return this.__GptPartInfo
        }
    }
}
