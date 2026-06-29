#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CorExceptionFlag.ahk" { CorExceptionFlag }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT {
    #StructPack 4

    Flags : CorExceptionFlag

    TryOffset : UInt32

    TryLength : UInt32

    HandlerOffset : UInt32

    HandlerLength : UInt32

    ClassToken : UInt32

    static __New() {
        DefineProp(this.Prototype, 'FilterOffset', { type: UInt32, offset: 20 })
        this.DeleteProp("__New")
    }
}
