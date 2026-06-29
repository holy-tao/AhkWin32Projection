#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_USERNAME_PASSWORD_CREDS.ahk" { WSMAN_USERNAME_PASSWORD_CREDS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_AUTHENTICATION_CREDENTIALS.ahk" { WSMAN_AUTHENTICATION_CREDENTIALS }

/**
 * Specifies proxy information.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_proxy_info
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PROXY_INFO {
    #StructPack 8

    /**
     * Specifies the access type for the proxy. This member must be set to one of the values defined in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmanproxyaccesstype">WSManProxyAccessType</a> enumeration.
     */
    accessType : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_authentication_credentials">WSMAN_AUTHENTICATION_CREDENTIALS</a> structure that specifies the credentials and authentication scheme used for proxy access.
     */
    authenticationCredentials : WSMAN_AUTHENTICATION_CREDENTIALS

}
