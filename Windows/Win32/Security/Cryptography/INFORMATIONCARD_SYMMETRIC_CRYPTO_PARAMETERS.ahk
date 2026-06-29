#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct INFORMATIONCARD_SYMMETRIC_CRYPTO_PARAMETERS {
    #StructPack 4

    keySize : Int32

    blockSize : Int32

    feedbackSize : Int32

}
