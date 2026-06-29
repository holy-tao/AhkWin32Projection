#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_PCP_HMAC_AUTH_SIGNATURE_INFO {
    #StructPack 4

    dwVersion : UInt32

    iExpiration : Int32

    pabNonce : Int8[32]

    pabPolicyRef : Int8[32]

    pabHMAC : Int8[32]

}
