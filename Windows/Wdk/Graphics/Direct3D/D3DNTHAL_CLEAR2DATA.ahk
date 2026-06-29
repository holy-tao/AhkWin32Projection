#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DRECT.ahk" { D3DRECT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_CLEAR2DATA {
    #StructPack 8

    dwhContext : IntPtr

    dwFlags : UInt32

    dwFillColor : UInt32

    dvFillDepth : Float32

    dwFillStencil : UInt32

    lpRects : D3DRECT.Ptr

    dwNumRects : UInt32

    ddrval : HRESULT

}
