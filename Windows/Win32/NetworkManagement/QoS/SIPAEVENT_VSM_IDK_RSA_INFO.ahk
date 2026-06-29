#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct SIPAEVENT_VSM_IDK_RSA_INFO {
    #StructPack 4

    KeyBitLength : UInt32

    PublicExpLengthBytes : UInt32

    ModulusSizeBytes : UInt32

    PublicKeyData : Int8[1]

}
