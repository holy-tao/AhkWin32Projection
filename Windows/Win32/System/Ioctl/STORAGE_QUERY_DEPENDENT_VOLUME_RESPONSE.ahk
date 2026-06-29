#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY.ahk" { STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY }
#Import ".\STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY.ahk" { STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Storage\Vhd\VIRTUAL_STORAGE_TYPE.ahk" { VIRTUAL_STORAGE_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_QUERY_DEPENDENT_VOLUME_RESPONSE {
    #StructPack 4

    ResponseLevel : UInt32

    NumberEntries : UInt32

    Lev1Depends : STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY[1]

    static __New() {
        DefineProp(this.Prototype, 'Lev2Depends', { type: STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY[1], offset: 8 })
        this.DeleteProp("__New")
    }
}
