#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_TEXTURECREATEDATA {
    #StructPack 8

    dwhContext : IntPtr

    hDDS : HANDLE

    dwHandle : IntPtr

    ddrval : HRESULT

}
