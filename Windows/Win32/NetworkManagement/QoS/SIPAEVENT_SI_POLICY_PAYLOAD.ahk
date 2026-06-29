#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct SIPAEVENT_SI_POLICY_PAYLOAD {
    #StructPack 8

    PolicyVersion : Int64

    PolicyNameLength : UInt16

    HashAlgID : UInt16

    DigestLength : UInt32

    VarLengthData : Int8[1]

}
