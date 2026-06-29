#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EX_RUNDOWN_REF {
    #StructPack 8

    Count : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'Ptr', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
