#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_PROCESSOR_ERROR {
    #StructPack 1

    CacheError : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'TlbError', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'BusError', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'AsULONGLONG', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
