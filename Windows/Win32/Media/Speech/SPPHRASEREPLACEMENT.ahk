#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASEREPLACEMENT {
    #StructPack 8

    bDisplayAttributes : Int8

    pszReplacementText : PWSTR

    ulFirstElement : UInt32

    ulCountOfElements : UInt32

}
