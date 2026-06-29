#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_LINENUMBER {
    #StructPack 2


    struct _Type {
        SymbolTableIndex : UInt32

        static __New() {
            DefineProp(this.Prototype, 'VirtualAddress', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : IMAGE_LINENUMBER._Type

    Linenumber : UInt16

}
