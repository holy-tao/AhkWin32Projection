#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASEELEMENT {
    #StructPack 8

    ulAudioTimeOffset : UInt32

    ulAudioSizeTime : UInt32

    ulAudioStreamOffset : UInt32

    ulAudioSizeBytes : UInt32

    ulRetainedStreamOffset : UInt32

    ulRetainedSizeBytes : UInt32

    pszDisplayText : PWSTR

    pszLexicalForm : PWSTR

    pszPronunciation : IntPtr

    bDisplayAttributes : Int8

    RequiredConfidence : Int8

    ActualConfidence : Int8

    Reserved : Int8

    SREngineConfidence : Float32

}
