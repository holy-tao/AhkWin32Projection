#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TELEPHONY_CALLTYPE.ahk" { TELEPHONY_CALLTYPE }
#Import ".\TELEPHONY_CALLCONTROLOP.ahk" { TELEPHONY_CALLCONTROLOP }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSTELEPHONY_CALLCONTROL {
    #StructPack 4

    CallType : TELEPHONY_CALLTYPE

    CallControlOp : TELEPHONY_CALLCONTROLOP

}
