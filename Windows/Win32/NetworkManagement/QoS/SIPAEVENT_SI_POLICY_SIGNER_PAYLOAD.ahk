#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct SIPAEVENT_SI_POLICY_SIGNER_PAYLOAD {
    #StructPack 4

    RootID : UInt32

    CertificatesLength : UInt32

    CertificatesCount : UInt16

    PolicyNameLength : UInt16

    EKUsLength : UInt16

    EKUsCount : UInt16

    VarLengthData : Int8[1]

}
