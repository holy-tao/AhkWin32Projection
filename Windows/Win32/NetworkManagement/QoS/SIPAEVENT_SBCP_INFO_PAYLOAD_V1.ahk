#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct SIPAEVENT_SBCP_INFO_PAYLOAD_V1 {
    #StructPack 4

    PayloadVersion : UInt32

    VarDataOffset : UInt32

    HashAlgID : UInt16

    DigestLength : UInt16

    Options : UInt32

    SignersCount : UInt32

    VarData : Int8[1]

}
