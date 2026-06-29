#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SIPAEVENT_VSM_IDK_RSA_INFO.ahk" { SIPAEVENT_VSM_IDK_RSA_INFO }

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct SIPAEVENT_VSM_IDK_INFO_PAYLOAD {
    #StructPack 4

    KeyAlgID : UInt32

    RsaKeyInfo : SIPAEVENT_VSM_IDK_RSA_INFO

}
