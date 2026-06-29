#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPAUDIOSTATE.ahk" { SPAUDIOSTATE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPAUDIOSTATUS.ahk" { SPAUDIOSTATUS }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRECOGNIZERSTATUS {
    #StructPack 8

    AudioStatus : SPAUDIOSTATUS

    ullRecognitionStreamPos : Int64

    ulStreamNumber : UInt32

    ulNumActive : UInt32

    clsidEngine : Guid

    cLangIDs : UInt32

    aLangID : UInt16[20]

    ullRecognitionStreamTime : Int64

}
