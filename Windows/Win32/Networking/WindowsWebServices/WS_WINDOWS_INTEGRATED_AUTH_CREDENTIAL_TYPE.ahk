#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of the Windows Integrated Authentication credential, used as a selector for subtypes of WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_windows_integrated_auth_credential_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE extends Win32Enum{

    /**
     * Type id for the Windows credential <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_string_windows_integrated_auth_credential">WS_STRING_WINDOWS_INTEGRATED_AUTH_CREDENTIAL</a>.
     * @type {Integer (Int32)}
     */
    static WS_STRING_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE => 1

    /**
     * Type id for the Windows credential <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_default_windows_integrated_auth_credential">WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL</a>.
     * @type {Integer (Int32)}
     */
    static WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE => 2

    /**
     * Type id for the Windows credential <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_opaque_windows_integrated_auth_credential">WS_OPAQUE_WINDOWS_INTEGRATED_AUTH_CREDENTIAL</a>.
     * @type {Integer (Int32)}
     */
    static WS_OPAQUE_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE => 3
}
