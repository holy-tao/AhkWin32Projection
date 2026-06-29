#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DDDIFORMAT.ahk" { D3DDDIFORMAT }
#Import "..\..\..\Win32\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\..\Win32\Graphics\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEDCFROMMEMORY {
    #StructPack 8

    pMemory : IntPtr

    Format : D3DDDIFORMAT

    Width : UInt32

    Height : UInt32

    Pitch : UInt32

    hDeviceDc : HDC

    pColorTable : PALETTEENTRY.Ptr

    hDc : HDC

    hBitmap : HANDLE

}
