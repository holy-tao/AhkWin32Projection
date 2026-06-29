#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPGRAMMARHANDLE.ahk" { SPGRAMMARHANDLE }
#Import ".\SPRESULTTYPE.ahk" { SPRESULTTYPE }
#Import ".\SPPHRASEALT.ahk" { SPPHRASEALT }
#Import ".\ISpPhraseBuilder.ahk" { ISpPhraseBuilder }
#Import ".\SPRECORESULTINFO.ahk" { SPRECORESULTINFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRECORESULTINFOEX {
    #StructPack 8

    Base : SPRECORESULTINFO

    ullStreamTimeStart : Int64

    ullStreamTimeEnd : Int64

}
