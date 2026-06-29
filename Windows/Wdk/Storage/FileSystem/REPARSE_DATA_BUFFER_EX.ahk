#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REPARSE_DATA_BUFFER_EX {
    #StructPack 8

    Flags : UInt32

    ExistingReparseTag : UInt32

    ExistingReparseGuid : Guid

    Reserved : Int64

    ReparseDataBuffer : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'ReparseGuidDataBuffer', { type: IntPtr, offset: 32 })
        this.DeleteProp("__New")
    }
}
