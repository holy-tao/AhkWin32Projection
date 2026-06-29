#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_SERIALIZED_OBJECT {
    #StructPack 8

    ClassId : Int8[16]

    SerializedData : CRYPT_INTEGER_BLOB

}
