#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct DS3DVECTOR {
    #StructPack 4

    x : Float32

    y : Float32

    z : Float32

    static __New() {
        DefineProp(this.Prototype, 'dvX', { type: Float32, offset: 0 })
        DefineProp(this.Prototype, 'dvY', { type: Float32, offset: 4 })
        DefineProp(this.Prototype, 'dvZ', { type: Float32, offset: 8 })
        this.DeleteProp("__New")
    }
}
