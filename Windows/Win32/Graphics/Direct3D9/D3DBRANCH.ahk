#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DBRANCH {
    #StructPack 4

    dwMask : UInt32

    dwValue : UInt32

    bNegate : BOOL

    dwOffset : UInt32

}
