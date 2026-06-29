#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EXPERIMENTAL_WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS.ahk" { EXPERIMENTAL_WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS_LIST {
    #StructPack 8

    pwszPluginClsId : PWSTR

    cCredentialDetails : UInt32

    pCredentialDetails : IntPtr

}
