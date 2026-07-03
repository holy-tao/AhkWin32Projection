#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XMIT_HELPER_ROUTINE.ahk" { XMIT_HELPER_ROUTINE }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct XMIT_ROUTINE_QUINTUPLE {
    #StructPack 8

    pfnTranslateToXmit : XMIT_HELPER_ROUTINE

    pfnTranslateFromXmit : XMIT_HELPER_ROUTINE

    pfnFreeXmit : XMIT_HELPER_ROUTINE

    pfnFreeInst : XMIT_HELPER_ROUTINE

}
