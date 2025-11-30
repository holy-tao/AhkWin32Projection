#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of the username/password credential, used as a selector for subtypes of WS_USERNAME_CREDENTIAL.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_username_credential_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_USERNAME_CREDENTIAL_TYPE extends Win32Enum{

    /**
     * Type ID for the username/password credential <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_string_username_credential">WS_STRING_USERNAME_CREDENTIAL</a>.
     * @type {Integer (Int32)}
     */
    static WS_STRING_USERNAME_CREDENTIAL_TYPE => 1
}
