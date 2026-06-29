#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_BOUNDS_LONGLONG {
    #StructPack 8

    SignedMinimum : Int64

    SignedMaximum : Int64

    static __New() {
        DefineProp(this.Prototype, 'UnsignedMinimum', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'UnsignedMaximum', { type: Int64, offset: 8 })
        this.DeleteProp("__New")
    }
}
