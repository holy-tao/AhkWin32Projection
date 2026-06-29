#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_RUNTIME_FUNCTION_ENTRY {
    #StructPack 4

    BeginAddress : UInt32

    EndAddress : UInt32

    UnwindInfoAddress : UInt32

    static __New() {
        DefineProp(this.Prototype, 'UnwindData', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
