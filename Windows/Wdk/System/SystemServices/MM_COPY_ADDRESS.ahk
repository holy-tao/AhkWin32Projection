#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MM_COPY_ADDRESS {
    #StructPack 8

    VirtualAddress : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'PhysicalAddress', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
