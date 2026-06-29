#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_RELOCATION {
    #StructPack 4

    VirtualAddress : UInt32

    SymbolTableIndex : UInt32

    Type : UInt16

    static __New() {
        DefineProp(this.Prototype, 'RelocCount', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
