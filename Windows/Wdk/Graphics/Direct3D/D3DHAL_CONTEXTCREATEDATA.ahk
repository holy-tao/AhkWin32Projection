#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Win32\Graphics\DirectDraw\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import "..\..\..\Win32\Graphics\DirectDraw\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import "..\..\..\Win32\Graphics\DirectDraw\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import "..\..\..\Win32\Graphics\DirectDraw\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_CONTEXTCREATEDATA {
    #StructPack 8

    lpDDGbl : DDRAWI_DIRECTDRAW_GBL.Ptr

    lpDDS : IDirectDrawSurface

    lpDDSZ : IDirectDrawSurface

    dwPID : UInt32

    dwhContext : IntPtr

    ddrval : HRESULT

    static __New() {
        DefineProp(this.Prototype, 'lpDDLcl', { type: DDRAWI_DIRECTDRAW_LCL.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'lpDDSLcl', { type: DDRAWI_DDRAWSURFACE_LCL.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'lpDDSZLcl', { type: DDRAWI_DDRAWSURFACE_LCL.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'dwrstates', { type: IntPtr, offset: 24 })
        this.DeleteProp("__New")
    }
}
