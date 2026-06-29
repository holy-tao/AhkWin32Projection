#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CERT_HASHED_URL.ahk" { CERT_HASHED_URL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CERT_BIOMETRIC_DATA_TYPE.ahk" { CERT_BIOMETRIC_DATA_TYPE }

/**
 * Contains information about biometric data.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_biometric_data
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_BIOMETRIC_DATA {
    #StructPack 8

    dwTypeOfBiometricDataChoice : CERT_BIOMETRIC_DATA_TYPE

    dwPredefined : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_hashed_url">CERT_HASHED_URL</a> structure that contains the hashed URL of the biometric data.
     */
    HashedUrl : CERT_HASHED_URL

    static __New() {
        DefineProp(this.Prototype, 'pszObjId', { type: PSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}
