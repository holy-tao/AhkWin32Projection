#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_GAMMA_RAMP_RGB256x3x16.ahk" { D3DDDI_GAMMA_RAMP_RGB256x3x16 }
#Import ".\D3DDDI_GAMMA_RAMP_DXGI_1.ahk" { D3DDDI_GAMMA_RAMP_DXGI_1 }
#Import ".\D3DDDI_GAMMARAMP_TYPE.ahk" { D3DDDI_GAMMARAMP_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SETGAMMARAMP {
    #StructPack 8

    hDevice : UInt32

    VidPnSourceId : UInt32

    Type : D3DDDI_GAMMARAMP_TYPE

    pGammaRampRgb256x3x16 : D3DDDI_GAMMA_RAMP_RGB256x3x16.Ptr

    Size : UInt32

    static __New() {
        DefineProp(this.Prototype, 'pGammaRampDXGI1', { type: D3DDDI_GAMMA_RAMP_DXGI_1.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
