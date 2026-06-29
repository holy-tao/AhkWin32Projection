#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS {
    #StructPack 8

    pwszAuthenticatorName : PWSTR

    rclsid : Guid.Ptr

    pwszPluginRpId : PWSTR

    pwszLightThemeLogoSvg : PWSTR

    pwszDarkThemeLogoSvg : PWSTR

    cbAuthenticatorInfo : UInt32

    pbAuthenticatorInfo : IntPtr

    cSupportedRpIds : UInt32

    ppwszSupportedRpIds : PWSTR.Ptr

}
