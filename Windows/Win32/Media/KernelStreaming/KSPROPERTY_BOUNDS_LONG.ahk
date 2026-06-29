#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_BOUNDS_LONG {
    #StructPack 4

    SignedMinimum : Int32

    SignedMaximum : Int32

    static __New() {
        DefineProp(this.Prototype, 'UnsignedMinimum', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'UnsignedMaximum', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
