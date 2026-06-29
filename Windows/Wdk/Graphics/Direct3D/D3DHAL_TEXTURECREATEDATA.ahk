#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\DirectDraw\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_TEXTURECREATEDATA {
    #StructPack 8

    dwhContext : IntPtr

    lpDDS : IDirectDrawSurface

    dwHandle : UInt32

    ddrval : HRESULT

}
