#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TELEPHONY_CALLSTATE.ahk" { TELEPHONY_CALLSTATE }
#Import ".\TELEPHONY_CALLTYPE.ahk" { TELEPHONY_CALLTYPE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSTELEPHONY_CALLINFO {
    #StructPack 4

    CallType : TELEPHONY_CALLTYPE

    CallState : TELEPHONY_CALLSTATE

}
