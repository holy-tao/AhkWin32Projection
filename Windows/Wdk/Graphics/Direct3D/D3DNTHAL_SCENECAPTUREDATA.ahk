#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_SCENECAPTUREDATA {
    #StructPack 8

    dwhContext : IntPtr

    dwFlag : UInt32

    ddrval : HRESULT

}
