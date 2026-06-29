#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KMTUMDVERSION.ahk" { KMTUMDVERSION }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_UMDFILENAMEINFO {
    #StructPack 4

    Version : KMTUMDVERSION

    UmdFileName : WCHAR[260]

}
