#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct SIPAEVENT_KSR_SIGNATURE_PAYLOAD {
    #StructPack 4

    SignAlgID : UInt32

    SignatureLength : UInt32

    Signature : Int8[1]

}
