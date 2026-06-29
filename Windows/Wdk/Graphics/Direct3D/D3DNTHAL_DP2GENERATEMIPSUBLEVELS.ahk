#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DTEXTUREFILTERTYPE.ahk" { D3DTEXTUREFILTERTYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2GENERATEMIPSUBLEVELS {
    #StructPack 4

    hSurface : UInt32

    Filter : D3DTEXTUREFILTERTYPE

}
