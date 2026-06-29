#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\KERB_CRYPTO_KEY_TYPE.ahk" { KERB_CRYPTO_KEY_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROFILE_BUFFER_TYPE.ahk" { KERB_PROFILE_BUFFER_TYPE }
#Import ".\KERB_INTERACTIVE_PROFILE.ahk" { KERB_INTERACTIVE_PROFILE }
#Import ".\KERB_CRYPTO_KEY.ahk" { KERB_CRYPTO_KEY }

/**
 * The KERB_TICKET_PROFILE structure contains information about an interactive logon profile. This structure is returned by LsaLogonUser.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_ticket_profile
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_TICKET_PROFILE {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_interactive_profile">KERB_INTERACTIVE_PROFILE</a> structure containing logon information.
     */
    Profile : KERB_INTERACTIVE_PROFILE

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_crypto_key">KERB_CRYPTO_KEY</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> for the Kerberos ticket.
     */
    SessionKey : KERB_CRYPTO_KEY

}
