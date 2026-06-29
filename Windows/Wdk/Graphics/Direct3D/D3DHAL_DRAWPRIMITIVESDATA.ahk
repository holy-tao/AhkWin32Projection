#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DRAWPRIMITIVESDATA {
    #StructPack 8

    dwhContext : IntPtr

    dwFlags : UInt32

    lpvData : IntPtr

    dwFVFControl : UInt32

    ddrval : HRESULT

}
