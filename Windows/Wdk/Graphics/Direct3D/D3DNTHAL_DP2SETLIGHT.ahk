#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2SETLIGHT {
    #StructPack 4

    dwIndex : UInt32

    lightData : UInt32

    static __New() {
        DefineProp(this.Prototype, 'dwDataType', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
