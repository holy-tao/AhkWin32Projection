#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct FunctionIDOrClientID {
    #StructPack 8

    functionID : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'clientID', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
