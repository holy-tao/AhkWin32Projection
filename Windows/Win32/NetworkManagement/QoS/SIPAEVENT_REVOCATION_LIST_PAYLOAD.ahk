#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct SIPAEVENT_REVOCATION_LIST_PAYLOAD {
    #StructPack 8

    CreationTime : Int64

    DigestLength : UInt32

    HashAlgID : UInt16

    Digest : Int8[1]

}
