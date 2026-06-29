#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_TEXTURESWAPDATA {
    #StructPack 8

    dwhContext : IntPtr

    dwHandle1 : IntPtr

    dwHandle2 : IntPtr

    ddrval : HRESULT

}
