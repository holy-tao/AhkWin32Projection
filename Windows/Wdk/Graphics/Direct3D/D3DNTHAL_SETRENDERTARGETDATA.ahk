#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Win32\Graphics\DirectDraw\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_SETRENDERTARGETDATA {
    #StructPack 8

    dwhContext : IntPtr

    lpDDS : DD_SURFACE_LOCAL.Ptr

    lpDDSZ : DD_SURFACE_LOCAL.Ptr

    ddrval : HRESULT

}
