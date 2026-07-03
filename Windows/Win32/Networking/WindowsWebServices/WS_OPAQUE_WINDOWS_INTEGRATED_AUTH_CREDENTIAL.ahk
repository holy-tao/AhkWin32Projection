#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE }

/**
 * Type for supplying a Windows Integrated Authentication credential as an opaque handle created by SspiPromptForCredentials and the related family of APIs. This feature is available only on Windows 7 and later.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_opaque_windows_integrated_auth_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_OPAQUE_WINDOWS_INTEGRATED_AUTH_CREDENTIAL {
    #StructPack 8

    /**
     * The base type from which this type and all other Windows Integrated Authentication credential types derive.
     */
    credential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL

    /**
     * The opaque form of authentication identity. The supplied value must be of the type PSEC_WINNT_AUTH_IDENTITY_OPAQUE.
     */
    opaqueAuthIdentity : IntPtr

}
