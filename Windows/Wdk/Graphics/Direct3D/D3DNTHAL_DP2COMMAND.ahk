#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2COMMAND {
    #StructPack 2

    bCommand : Int8

    bReserved : Int8

    wPrimitiveCount : UInt16

    static __New() {
        DefineProp(this.Prototype, 'wStateCount', { type: UInt16, offset: 2 })
        this.DeleteProp("__New")
    }
}
