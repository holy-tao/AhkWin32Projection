#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WIDTHRUN.ahk" { WIDTHRUN }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct WIDTHTABLE {
    #StructPack 4

    dwSize : UInt32

    dwRunNum : UInt32

    WidthRun : WIDTHRUN[1]

}
