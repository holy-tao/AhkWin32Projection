#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_GETSTATEDATA {
    #StructPack 8

    dwhContext : IntPtr

    dwWhich : UInt32

    ddState : IntPtr

    ddrval : HRESULT

}
