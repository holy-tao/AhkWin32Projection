#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPVACTIONS.ahk" { SPVACTIONS }
#Import ".\SPVCONTEXT.ahk" { SPVCONTEXT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPPARTOFSPEECH.ahk" { SPPARTOFSPEECH }
#Import ".\SPVPITCH.ahk" { SPVPITCH }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPVSTATE {
    #StructPack 8

    eAction : SPVACTIONS

    LangID : UInt16

    wReserved : UInt16

    EmphAdj : Int32

    RateAdj : Int32

    Volume : UInt32

    PitchAdj : SPVPITCH

    SilenceMSecs : UInt32

    pPhoneIds : IntPtr

    ePartOfSpeech : SPPARTOFSPEECH

    Context : SPVCONTEXT

}
