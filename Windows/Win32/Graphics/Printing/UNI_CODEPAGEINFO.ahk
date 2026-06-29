#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INVOC.ahk" { INVOC }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct UNI_CODEPAGEINFO {
    #StructPack 4

    dwCodePage : UInt32

    SelectSymbolSet : INVOC

    UnSelectSymbolSet : INVOC

}
