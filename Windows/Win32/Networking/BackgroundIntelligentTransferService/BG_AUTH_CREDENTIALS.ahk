#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BG_AUTH_TARGET.ahk" { BG_AUTH_TARGET }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BG_AUTH_CREDENTIALS_UNION.ahk" { BG_AUTH_CREDENTIALS_UNION }
#Import ".\BG_BASIC_CREDENTIALS.ahk" { BG_BASIC_CREDENTIALS }
#Import ".\BG_AUTH_SCHEME.ahk" { BG_AUTH_SCHEME }

/**
 * Identifies the target (proxy or server), authentication scheme, and the user's credentials to use for user authentication requests. The structure is passed to the IBackgroundCopyJob2::SetCredentials method.
 * @see https://learn.microsoft.com/windows/win32/api/bits1_5/ns-bits1_5-bg_auth_credentials
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_AUTH_CREDENTIALS {
    #StructPack 8

    /**
     * Identifies whether to use the credentials for a proxy or server authentication request. For a list of values, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ne-bits1_5-bg_auth_target">BG_AUTH_TARGET</a> enumeration. You can specify only one value.
     */
    Target : BG_AUTH_TARGET

    /**
     * Identifies the scheme to use for authentication (for example, Basic or NTLM). For a list of values, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ne-bits1_5-bg_auth_scheme">BG_AUTH_SCHEME</a> enumeration. You can specify only one value.
     */
    Scheme : BG_AUTH_SCHEME

    /**
     * Identifies the credentials to use for the specified authentication scheme. For details, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_auth_credentials_union">BG_AUTH_CREDENTIALS_UNION</a> union.
     */
    Credentials : BG_AUTH_CREDENTIALS_UNION

}
