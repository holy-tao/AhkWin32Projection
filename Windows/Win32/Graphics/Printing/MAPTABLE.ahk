#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRANSDATA.ahk" { TRANSDATA }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MAPTABLE {
    #StructPack 4

    dwSize : UInt32

    dwGlyphNum : UInt32

    Trans : TRANSDATA[1]

}
