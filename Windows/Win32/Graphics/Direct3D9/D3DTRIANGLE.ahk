#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DTRIANGLE {
    #StructPack 2

    v1 : UInt16

    v2 : UInt16

    v3 : UInt16

    wFlags : UInt16

    static __New() {
        DefineProp(this.Prototype, 'wV1', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'wV2', { type: UInt16, offset: 2 })
        DefineProp(this.Prototype, 'wV3', { type: UInt16, offset: 4 })
        this.DeleteProp("__New")
    }
}
