#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HandleType.ahk" { HandleType }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct INFORMATIONCARD_CRYPTO_HANDLE {
    #StructPack 8

    type : HandleType

    expiration : Int64

    cryptoParameters : IntPtr

}
