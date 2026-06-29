#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\DirectDraw\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Win32\Graphics\DirectDraw\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import "..\..\..\Win32\Graphics\DirectDraw\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_CONTEXTCREATEDATA {
    #StructPack 8

    lpDDGbl : DD_DIRECTDRAW_GLOBAL.Ptr

    lpDDS : DD_SURFACE_LOCAL.Ptr

    lpDDSZ : DD_SURFACE_LOCAL.Ptr

    dwPID : UInt32

    dwhContext : IntPtr

    ddrval : HRESULT

    static __New() {
        DefineProp(this.Prototype, 'lpDDLcl', { type: DD_DIRECTDRAW_LOCAL.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'lpDDSLcl', { type: DD_SURFACE_LOCAL.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'lpDDSZLcl', { type: DD_SURFACE_LOCAL.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
