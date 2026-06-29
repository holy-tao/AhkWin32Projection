#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DRENDERSTATETYPE.ahk" { D3DRENDERSTATETYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2RENDERSTATE {
    #StructPack 4

    RenderState : D3DRENDERSTATETYPE

    fState : Float32

    static __New() {
        DefineProp(this.Prototype, 'dwState', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
