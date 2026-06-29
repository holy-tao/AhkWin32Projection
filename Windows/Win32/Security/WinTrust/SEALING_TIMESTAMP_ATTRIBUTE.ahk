#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SEALING_TIMESTAMP_ATTRIBUTE {
    #StructPack 8

    version : UInt32

    signerIndex : UInt32

    sealTimeStampToken : CRYPT_INTEGER_BLOB

}
