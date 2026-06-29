#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS.ahk" { INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct INFORMATIONCARD_HASH_CRYPTO_PARAMETERS {
    #StructPack 4

    hashSize : Int32

    transform : INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS

}
