#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DLIGHTSTATETYPE.ahk" { D3DLIGHTSTATETYPE }
#Import ".\D3DRENDERSTATETYPE.ahk" { D3DRENDERSTATETYPE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSTATE {
    #StructPack 4

    dlstLightStateType : D3DLIGHTSTATETYPE

    dwArg : UInt32[1]

    static __New() {
        DefineProp(this.Prototype, 'drstRenderStateType', { type: D3DRENDERSTATETYPE, offset: 0 })
        DefineProp(this.Prototype, 'dvArg', { type: Float32[1], offset: 4 })
        this.DeleteProp("__New")
    }
}
