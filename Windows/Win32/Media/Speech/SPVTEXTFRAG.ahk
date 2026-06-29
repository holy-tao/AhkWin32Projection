#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPVACTIONS.ahk" { SPVACTIONS }
#Import ".\SPVCONTEXT.ahk" { SPVCONTEXT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPPARTOFSPEECH.ahk" { SPPARTOFSPEECH }
#Import ".\SPVPITCH.ahk" { SPVPITCH }
#Import ".\SPVSTATE.ahk" { SPVSTATE }

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
