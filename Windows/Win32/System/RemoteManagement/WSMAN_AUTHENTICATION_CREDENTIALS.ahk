#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_USERNAME_PASSWORD_CREDS.ahk

/**
 * Defines the authentication method and the credentials used for server or proxy authentication.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_authentication_credentials
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_AUTHENTICATION_CREDENTIALS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Defines the authentication mechanism. This member can be set to zero. If it is set to zero, the WinRM client will choose between Kerberos and Negotiate. If it is not set to zero, this member must be one of the values of the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmanauthenticationflags">WSManAuthenticationFlags</a> enumeration.
     * @type {Integer}
     */
    authenticationMechanism {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {WSMAN_USERNAME_PASSWORD_CREDS}
     */
    userAccount{
        get {
            if(!this.HasProp("__userAccount"))
                this.__userAccount := WSMAN_USERNAME_PASSWORD_CREDS(8, this)
            return this.__userAccount
        }
    }

    /**
     * @type {PWSTR}
     */
    certificateThumbprint {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
