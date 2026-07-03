#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ISpPhraseBuilder.ahk" { ISpPhraseBuilder }
#Import ".\SPGRAMMARHANDLE.ahk" { SPGRAMMARHANDLE }
#Import ".\SPPHRASEALT.ahk" { SPPHRASEALT }
#Import ".\SPRESULTTYPE.ahk" { SPRESULTTYPE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRECORESULTINFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    eResultType : SPRESULTTYPE

    fHypothesis : BOOL

    fProprietaryAutoPause : BOOL

    ullStreamPosStart : Int64

    ullStreamPosEnd : Int64

    hGrammar : SPGRAMMARHANDLE

    ulSizeEngineData : UInt32

    pvEngineData : IntPtr

    pPhrase : ISpPhraseBuilder

    aPhraseAlts : SPPHRASEALT.Ptr

    ulNumAlts : UInt32

}
