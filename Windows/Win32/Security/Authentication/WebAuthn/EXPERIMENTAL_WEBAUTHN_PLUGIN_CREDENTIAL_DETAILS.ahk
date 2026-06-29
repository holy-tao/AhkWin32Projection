#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS {
    #StructPack 8

    cbCredentialId : UInt32

    pbCredentialId : IntPtr

    pwszRpId : PWSTR

    pwszRpName : PWSTR

    cbUserId : UInt32

    pbUserId : IntPtr

    pwszUserName : PWSTR

    pwszUserDisplayName : PWSTR

}
