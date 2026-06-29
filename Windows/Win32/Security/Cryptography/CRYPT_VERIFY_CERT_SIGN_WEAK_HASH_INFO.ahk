#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_VERIFY_CERT_SIGN_WEAK_HASH_INFO {
    #StructPack 8

    cCNGHashAlgid : UInt32

    rgpwszCNGHashAlgid : PWSTR.Ptr

    dwWeakIndex : UInt32

}
