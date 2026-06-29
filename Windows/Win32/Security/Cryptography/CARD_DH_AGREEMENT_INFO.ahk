#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_DH_AGREEMENT_INFO {
    #StructPack 8

    dwVersion : UInt32

    bContainerIndex : Int8

    dwFlags : UInt32

    dwPublicKey : UInt32

    pbPublicKey : IntPtr

    pbReserved : IntPtr

    cbReserved : UInt32

    bSecretAgreementIndex : Int8

}
