#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLAIMLIST.ahk" { CLAIMLIST }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\ENDPOINTADDRESS.ahk" { ENDPOINTADDRESS }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct RECIPIENTPOLICY {
    #StructPack 8

    recipient : ENDPOINTADDRESS

    issuer : ENDPOINTADDRESS

    tokenType : PWSTR

    requiredClaims : CLAIMLIST

    optionalClaims : CLAIMLIST

    privacyUrl : PWSTR

    privacyVersion : UInt32

}
