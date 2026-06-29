#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\VDS_PARTITION_STYLE.ahk" { VDS_PARTITION_STYLE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Defines the partition parameters of a partition style. (CREATE_PARTITION_PARAMETERS)
 * @remarks
 * The 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-createpartition">IVdsAdvancedDisk::CreatePartition</a> 
 *     method passes this structure as an argument to specify a set of parameters.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-create_partition_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct CREATE_PARTITION_PARAMETERS {
    #StructPack 8


    struct _MbrPartInfo {
        partitionType : Int8

        bootIndicator : BOOLEAN

    }

    struct _GptPartInfo {
        partitionType : Guid

        partitionId : Guid

        attributes : Int64

        name : WCHAR[36]

    }

    style : VDS_PARTITION_STYLE

    MbrPartInfo : CREATE_PARTITION_PARAMETERS._MbrPartInfo

    static __New() {
        DefineProp(this.Prototype, 'GptPartInfo', { type: CREATE_PARTITION_PARAMETERS._GptPartInfo, offset: 8 })
        this.DeleteProp("__New")
    }
}
