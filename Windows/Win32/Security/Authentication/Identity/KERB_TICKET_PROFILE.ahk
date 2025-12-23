#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\KERB_INTERACTIVE_PROFILE.ahk
#Include .\KERB_CRYPTO_KEY.ahk

/**
 * The KERB_TICKET_PROFILE structure contains information about an interactive logon profile. This structure is returned by LsaLogonUser.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_ticket_profile
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_TICKET_PROFILE extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_interactive_profile">KERB_INTERACTIVE_PROFILE</a> structure containing logon information.
     * @type {KERB_INTERACTIVE_PROFILE}
     */
    Profile{
        get {
            if(!this.HasProp("__Profile"))
                this.__Profile := KERB_INTERACTIVE_PROFILE(0, this)
            return this.__Profile
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_crypto_key">KERB_CRYPTO_KEY</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> for the Kerberos ticket.
     * @type {KERB_CRYPTO_KEY}
     */
    SessionKey{
        get {
            if(!this.HasProp("__SessionKey"))
                this.__SessionKey := KERB_CRYPTO_KEY(160, this)
            return this.__SessionKey
        }
    }
}
