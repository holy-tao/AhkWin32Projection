#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ENDPOINTADDRESS2.ahk" { ENDPOINTADDRESS2 }
#Import ".\CLAIMLIST.ahk" { CLAIMLIST }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct RECIPIENTPOLICY2 {
    #StructPack 8

    recipient : ENDPOINTADDRESS2

    issuer : ENDPOINTADDRESS2

    tokenType : PWSTR

    requiredClaims : CLAIMLIST

    optionalClaims : CLAIMLIST

    privacyUrl : PWSTR

    privacyVersion : UInt32

}
