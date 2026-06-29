#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DTRANSFORMSTATETYPE.ahk" { D3DTRANSFORMSTATETYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DP2MULTIPLYTRANSFORM {
    #StructPack 8

    xfrmType : D3DTRANSFORMSTATETYPE

    matrix : IntPtr

}
