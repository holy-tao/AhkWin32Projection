#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_VALUE {
    #StructPack 8


    struct _Value {
        dbl : Float64

        static __New() {
            DefineProp(this.Prototype, 'ull', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'ul', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'ratio', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'l', { type: Int32, offset: 0 })
            DefineProp(this.Prototype, 'll', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Value : KSCAMERA_EXTENDEDPROP_VALUE._Value

}
