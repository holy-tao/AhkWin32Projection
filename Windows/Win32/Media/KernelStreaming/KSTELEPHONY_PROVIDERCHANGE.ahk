#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TELEPHONY_CALLTYPE.ahk" { TELEPHONY_CALLTYPE }
#Import ".\TELEPHONY_PROVIDERCHANGEOP.ahk" { TELEPHONY_PROVIDERCHANGEOP }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSTELEPHONY_PROVIDERCHANGE {
    #StructPack 4

    CallType : TELEPHONY_CALLTYPE

    ProviderChangeOp : TELEPHONY_PROVIDERCHANGEOP

}
