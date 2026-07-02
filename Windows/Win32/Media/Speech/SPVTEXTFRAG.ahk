#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPVPITCH.ahk" { SPVPITCH }
#Import ".\SPPARTOFSPEECH.ahk" { SPPARTOFSPEECH }
#Import ".\SPVSTATE.ahk" { SPVSTATE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPVACTIONS.ahk" { SPVACTIONS }
#Import ".\SPVCONTEXT.ahk" { SPVCONTEXT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPVTEXTFRAG {
    #StructPack 8

    pNext : SPVTEXTFRAG.Ptr

    State : SPVSTATE

    pTextStart : PWSTR

    ulTextLen : UInt32

    ulTextSrcOffset : UInt32

}
