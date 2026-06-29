#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KMT_DISPLAY_UMD_VERSION.ahk" { KMT_DISPLAY_UMD_VERSION }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DISPLAY_UMD_FILENAMEINFO {
    #StructPack 4

    Version : KMT_DISPLAY_UMD_VERSION

    UmdFileName : WCHAR[260]

}
