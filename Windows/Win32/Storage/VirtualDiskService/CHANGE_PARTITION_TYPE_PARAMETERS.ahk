#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_PARTITION_STYLE.ahk" { VDS_PARTITION_STYLE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes parameters to be used when changing a partition's type.
 * @remarks
 * For information about partition types, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-change_partition_type_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct CHANGE_PARTITION_TYPE_PARAMETERS {
    #StructPack 4


    struct _MbrPartInfo {
        partitionType : Int8

    }

    struct _GptPartInfo {
        partitionType : Guid

    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_style">VDS_PARTITION_STYLE</a> enumeration that describes the disk's partition style.
     */
    style : VDS_PARTITION_STYLE

    MbrPartInfo : CHANGE_PARTITION_TYPE_PARAMETERS._MbrPartInfo

    static __New() {
        DefineProp(this.Prototype, 'GptPartInfo', { type: CHANGE_PARTITION_TYPE_PARAMETERS._GptPartInfo, offset: 4 })
        this.DeleteProp("__New")
    }
}
