#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ISpPhraseBuilder.ahk" { ISpPhraseBuilder }
#Import ".\SPGRAMMARHANDLE.ahk" { SPGRAMMARHANDLE }
#Import ".\SPPHRASEALT.ahk" { SPPHRASEALT }
#Import ".\SPRECORESULTINFO.ahk" { SPRECORESULTINFO }
#Import ".\SPRESULTTYPE.ahk" { SPRESULTTYPE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRECORESULTINFOEX {
    #StructPack 8

    Base : SPRECORESULTINFO

    ullStreamTimeStart : Int64

    ullStreamTimeEnd : Int64

}
