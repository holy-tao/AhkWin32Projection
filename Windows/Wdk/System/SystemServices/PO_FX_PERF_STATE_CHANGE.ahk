#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_PERF_STATE_CHANGE {
    #StructPack 8

    Set : UInt32

    StateIndex : UInt32

    static __New() {
        DefineProp(this.Prototype, 'StateValue', { type: Int64, offset: 8 })
        this.DeleteProp("__New")
    }
}
