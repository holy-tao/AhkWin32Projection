#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct INFORMATIONCARD_ASYMMETRIC_CRYPTO_PARAMETERS {
    #StructPack 8

    keySize : Int32

    keyExchangeAlgorithm : PWSTR

    signatureAlgorithm : PWSTR

}
