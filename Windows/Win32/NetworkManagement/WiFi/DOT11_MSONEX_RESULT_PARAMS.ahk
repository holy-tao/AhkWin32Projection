#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_EAP_RESULT.ahk" { DOT11_EAP_RESULT }
#Import ".\ONEX_REASON_CODE.ahk" { ONEX_REASON_CODE }
#Import ".\ONEX_AUTH_STATUS.ahk" { ONEX_AUTH_STATUS }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MSONEX_RESULT_PARAMS {
    #StructPack 8

    Dot11OnexAuthStatus : ONEX_AUTH_STATUS

    Dot11OneXReasonCode : ONEX_REASON_CODE

    pbMPPESendKey : IntPtr

    dwMPPESendKeyLen : UInt32

    pbMPPERecvKey : IntPtr

    dwMPPERecvKeyLen : UInt32

    pDot11EapResult : DOT11_EAP_RESULT.Ptr

}
