#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPLEXICONTYPE.ahk" { SPLEXICONTYPE }
#Import ".\SPPARTOFSPEECH.ahk" { SPPARTOFSPEECH }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPWORDPRONUNCIATION {
    #StructPack 8

    pNextWordPronunciation : SPWORDPRONUNCIATION.Ptr

    eLexiconType : SPLEXICONTYPE

    LangID : UInt16

    wPronunciationFlags : UInt16

    ePartOfSpeech : SPPARTOFSPEECH

    szPronunciation : UInt16[1]

}
