#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_USERNAME_PASSWORD_CREDS.ahk" { WSMAN_USERNAME_PASSWORD_CREDS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines the authentication method and the credentials used for server or proxy authentication.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_authentication_credentials
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_AUTHENTICATION_CREDENTIALS {
    #StructPack 8

    /**
     * Defines the authentication mechanism. This member can be set to zero. If it is set to zero, the WinRM client will choose between Kerberos and Negotiate. If it is not set to zero, this member must be one of the values of the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmanauthenticationflags">WSManAuthenticationFlags</a> enumeration.
     */
    authenticationMechanism : UInt32

    userAccount : WSMAN_USERNAME_PASSWORD_CREDS

    static __New() {
        DefineProp(this.Prototype, 'certificateThumbprint', { type: PWSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}
