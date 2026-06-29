#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct DISPATCHER_CONTEXT_NONVOLREG_ARM64 {
    #StructPack 8

    Buffer : Int8[152]

    static __New() {
        DefineProp(this.Prototype, 'GpNvRegs', { type: Int64[11], offset: 0 })
        DefineProp(this.Prototype, 'FpNvRegs', { type: Float64[8], offset: 88 })
        this.DeleteProp("__New")
    }
}
