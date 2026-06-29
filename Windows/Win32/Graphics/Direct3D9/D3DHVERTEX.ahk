#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DHVERTEX {
    #StructPack 4

    dwFlags : UInt32

    hx : Float32

    hy : Float32

    hz : Float32

    static __New() {
        DefineProp(this.Prototype, 'dvHX', { type: Float32, offset: 4 })
        DefineProp(this.Prototype, 'dvHY', { type: Float32, offset: 8 })
        DefineProp(this.Prototype, 'dvHZ', { type: Float32, offset: 12 })
        this.DeleteProp("__New")
    }
}
