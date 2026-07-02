#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SPPHRASEALT.ahk" { SPPHRASEALT }
#Import ".\ISpPhraseBuilder.ahk" { ISpPhraseBuilder }
#Import ".\SPRECORESULTINFO.ahk" { SPRECORESULTINFO }
#Import ".\SPRESULTTYPE.ahk" { SPRESULTTYPE }
#Import ".\SPGRAMMARHANDLE.ahk" { SPGRAMMARHANDLE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRECORESULTINFOEX {
    #StructPack 8

    Base : SPRECORESULTINFO

    ullStreamTimeStart : Int64

    ullStreamTimeEnd : Int64

}
