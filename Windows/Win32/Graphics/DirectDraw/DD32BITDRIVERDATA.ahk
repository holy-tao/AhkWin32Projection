#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD32BITDRIVERDATA {
    #StructPack 4

    szName : CHAR[260]

    szEntryPoint : CHAR[64]

    dwContext : UInt32

}
