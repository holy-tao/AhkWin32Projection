#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Graphics\Gdi\HDC.ahk" { HDC }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DESTROYDCFROMMEMORY {
    #StructPack 8

    hDc : HDC

    hBitmap : HANDLE

}
