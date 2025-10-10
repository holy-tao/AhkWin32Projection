#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_USERNAME_PASSWORD_CREDS.ahk
#Include .\WSMAN_AUTHENTICATION_CREDENTIALS.ahk

/**
 * Specifies proxy information.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_proxy_info
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PROXY_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the access type for the proxy. This member must be set to one of the values defined in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmanproxyaccesstype">WSManProxyAccessType</a> enumeration.
     * @type {Integer}
     */
    accessType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_authentication_credentials">WSMAN_AUTHENTICATION_CREDENTIALS</a> structure that specifies the credentials and authentication scheme used for proxy access.
     * @type {WSMAN_AUTHENTICATION_CREDENTIALS}
     */
    authenticationCredentials{
        get {
            if(!this.HasProp("__authenticationCredentials"))
                this.__authenticationCredentials := WSMAN_AUTHENTICATION_CREDENTIALS(this.ptr + 8)
            return this.__authenticationCredentials
        }
    }
}
