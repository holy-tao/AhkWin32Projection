#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\VDS_PARTITION_STYLE.ahk" { VDS_PARTITION_STYLE }

/**
 * Defines the partition parameters of a partition style. (CHANGE_ATTRIBUTES_PARAMETERS)
 * @remarks
 * The 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-changeattributes">IVdsAdvancedDisk::ChangeAttributes</a> 
 *     method takes this structure as a parameter.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-change_attributes_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct CHANGE_ATTRIBUTES_PARAMETERS {
    #StructPack 8


    struct _MbrPartInfo {
        bootIndicator : BOOLEAN

    }

    struct _GptPartInfo {
        attributes : Int64

    }

    /**
     * Determines the partition parameters. Supported values are <b>VDS_PST_MBR</b> or 
     *       <b>VDS_PST_GPT</b>.
     */
    style : VDS_PARTITION_STYLE

    MbrPartInfo : CHANGE_ATTRIBUTES_PARAMETERS._MbrPartInfo

    static __New() {
        DefineProp(this.Prototype, 'GptPartInfo', { type: CHANGE_ATTRIBUTES_PARAMETERS._GptPartInfo, offset: 8 })
        this.DeleteProp("__New")
    }
}
