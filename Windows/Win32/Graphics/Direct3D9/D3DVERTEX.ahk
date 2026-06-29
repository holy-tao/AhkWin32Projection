#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVERTEX {
    #StructPack 4

    x : Float32

    y : Float32

    z : Float32

    nx : Float32

    ny : Float32

    nz : Float32

    tu : Float32

    tv : Float32

    static __New() {
        DefineProp(this.Prototype, 'dvX', { type: Float32, offset: 0 })
        DefineProp(this.Prototype, 'dvY', { type: Float32, offset: 4 })
        DefineProp(this.Prototype, 'dvZ', { type: Float32, offset: 8 })
        DefineProp(this.Prototype, 'dvNX', { type: Float32, offset: 12 })
        DefineProp(this.Prototype, 'dvNY', { type: Float32, offset: 16 })
        DefineProp(this.Prototype, 'dvNZ', { type: Float32, offset: 20 })
        DefineProp(this.Prototype, 'dvTU', { type: Float32, offset: 24 })
        DefineProp(this.Prototype, 'dvTV', { type: Float32, offset: 28 })
        this.DeleteProp("__New")
    }
}
