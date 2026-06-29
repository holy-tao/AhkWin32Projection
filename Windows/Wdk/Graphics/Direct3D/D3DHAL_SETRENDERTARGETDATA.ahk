#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\DirectDraw\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Win32\Graphics\DirectDraw\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_SETRENDERTARGETDATA {
    #StructPack 8

    dwhContext : IntPtr

    lpDDS : IDirectDrawSurface

    lpDDSZ : IDirectDrawSurface

    ddrval : HRESULT

    static __New() {
        DefineProp(this.Prototype, 'lpDDSLcl', { type: DDRAWI_DDRAWSURFACE_LCL.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'lpDDSZLcl', { type: DDRAWI_DDRAWSURFACE_LCL.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
