#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS {
    #StructPack 8

    pwszAuthenticatorName : PWSTR

    pwszPluginClsId : PWSTR

    pwszNewPluginClsId : PWSTR

    pwszLightThemeLogo : PWSTR

    pwszDarkThemeLogo : PWSTR

    cbAuthenticatorInfo : UInt32

    pbAuthenticatorInfo : IntPtr

}
