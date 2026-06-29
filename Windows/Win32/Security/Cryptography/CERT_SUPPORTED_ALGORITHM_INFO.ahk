#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_POLICIES_INFO.ahk" { CERT_POLICIES_INFO }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_POLICY_INFO.ahk" { CERT_POLICY_INFO }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_SUPPORTED_ALGORITHM_INFO {
    #StructPack 8

    Algorithm : CRYPT_ALGORITHM_IDENTIFIER

    IntendedKeyUsage : CRYPT_BIT_BLOB

    IntendedCertPolicies : CERT_POLICIES_INFO

}
