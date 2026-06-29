#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_TLSA_DATA {
    #StructPack 2

    bCertUsage : Int8

    bSelector : Int8

    bMatchingType : Int8

    bCertificateAssociationDataLength : UInt16

    bPad : Int8[3]

    bCertificateAssociationData : Int8[1]

}
