#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct ARM64_NT_NEON128 {
    #StructPack 8

    Low : Int64

    High : Int64

    static __New() {
        DefineProp(this.Prototype, 'D', { type: Float64[2], offset: 0 })
        DefineProp(this.Prototype, 'S', { type: Float32[4], offset: 0 })
        DefineProp(this.Prototype, 'H', { type: UInt16[8], offset: 0 })
        DefineProp(this.Prototype, 'B', { type: Int8[16], offset: 0 })
        this.DeleteProp("__New")
    }
}
