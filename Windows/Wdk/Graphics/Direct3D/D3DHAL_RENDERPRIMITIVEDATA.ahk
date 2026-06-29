#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\DirectDraw\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_RENDERPRIMITIVEDATA {
    #StructPack 8

    dwhContext : IntPtr

    dwOffset : UInt32

    dwStatus : UInt32

    lpExeBuf : IDirectDrawSurface

    dwTLOffset : UInt32

    lpTLBuf : IDirectDrawSurface

    diInstruction : IntPtr

    ddrval : HRESULT

}
