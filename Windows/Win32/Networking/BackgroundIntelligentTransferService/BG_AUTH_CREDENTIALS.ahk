#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\BG_BASIC_CREDENTIALS.ahk
#Include .\BG_AUTH_CREDENTIALS_UNION.ahk

/**
 * Identifies the target (proxy or server), authentication scheme, and the user's credentials to use for user authentication requests. The structure is passed to the IBackgroundCopyJob2::SetCredentials method.
 * @see https://learn.microsoft.com/windows/win32/api/bits1_5/ns-bits1_5-bg_auth_credentials
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_AUTH_CREDENTIALS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Identifies whether to use the credentials for a proxy or server authentication request. For a list of values, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ne-bits1_5-bg_auth_target">BG_AUTH_TARGET</a> enumeration. You can specify only one value.
     * @type {Integer}
     */
    Target {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Identifies the scheme to use for authentication (for example, Basic or NTLM). For a list of values, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ne-bits1_5-bg_auth_scheme">BG_AUTH_SCHEME</a> enumeration. You can specify only one value.
     * @type {Integer}
     */
    Scheme {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Identifies the credentials to use for the specified authentication scheme. For details, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_auth_credentials_union">BG_AUTH_CREDENTIALS_UNION</a> union.
     * @type {BG_AUTH_CREDENTIALS_UNION}
     */
    Credentials{
        get {
            if(!this.HasProp("__Credentials"))
                this.__Credentials := BG_AUTH_CREDENTIALS_UNION(this.ptr + 8)
            return this.__Credentials
        }
    }
}
