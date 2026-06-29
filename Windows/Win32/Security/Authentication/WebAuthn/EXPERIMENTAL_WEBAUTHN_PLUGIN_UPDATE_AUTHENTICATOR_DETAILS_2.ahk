#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS_2 {
    #StructPack 8

    pwszAuthenticatorName : PWSTR

    pClsid : Guid.Ptr

    pClsidNew : Guid.Ptr

    pwszLightThemeLogoSvg : PWSTR

    pwszDarkThemeLogoSvg : PWSTR

    cbAuthenticatorInfo : UInt32

    pbAuthenticatorInfo : IntPtr

    cSupportedRpIds : UInt32

    ppwszSupportedRpIds : PWSTR.Ptr

    pwszUserVerificationKeyName : PWSTR

}
