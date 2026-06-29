#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct SIPAEVENT_SI_POLICY_CERTIFICATE_PAYLOAD {
    #StructPack 4

    PublisherCommonNameLength : UInt16

    IssuerCommonNameLength : UInt16

    HashAlgID : UInt32

    DigestLength : UInt16

    VarLengthData : Int8[1]

}
