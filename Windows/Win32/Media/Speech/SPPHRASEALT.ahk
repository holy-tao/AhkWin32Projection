#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ISpPhraseBuilder.ahk" { ISpPhraseBuilder }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASEALT {
    #StructPack 8

    pPhrase : ISpPhraseBuilder

    ulStartElementInParent : UInt32

    cElementsInParent : UInt32

    cElementsInAlternate : UInt32

    pvAltExtra : IntPtr

    cbAltExtra : UInt32

}
