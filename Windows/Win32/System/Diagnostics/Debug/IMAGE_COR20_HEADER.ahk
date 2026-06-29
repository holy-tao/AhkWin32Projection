#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_DATA_DIRECTORY.ahk" { IMAGE_DATA_DIRECTORY }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_COR20_HEADER {
    #StructPack 4

    cb : UInt32

    MajorRuntimeVersion : UInt16

    MinorRuntimeVersion : UInt16

    MetaData : IMAGE_DATA_DIRECTORY

    Flags : UInt32

    EntryPointToken : UInt32

    Resources : IMAGE_DATA_DIRECTORY

    StrongNameSignature : IMAGE_DATA_DIRECTORY

    CodeManagerTable : IMAGE_DATA_DIRECTORY

    VTableFixups : IMAGE_DATA_DIRECTORY

    ExportAddressTableJumps : IMAGE_DATA_DIRECTORY

    ManagedNativeHeader : IMAGE_DATA_DIRECTORY

    static __New() {
        DefineProp(this.Prototype, 'EntryPointRVA', { type: UInt32, offset: 20 })
        this.DeleteProp("__New")
    }
}
