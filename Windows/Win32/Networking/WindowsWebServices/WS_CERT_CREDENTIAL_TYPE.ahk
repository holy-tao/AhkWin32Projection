#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of the certificate credential, used as a selector for subtypes of WS_CERT_CREDENTIAL.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_cert_credential_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CERT_CREDENTIAL_TYPE extends Win32Enum{

    /**
     * Type id for the certificate credential <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_subject_name_cert_credential">WS_SUBJECT_NAME_CERT_CREDENTIAL</a>.
     * @type {Integer (Int32)}
     */
    static WS_SUBJECT_NAME_CERT_CREDENTIAL_TYPE => 1

    /**
     * Type id for the certificate credential <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_thumbprint_cert_credential">WS_THUMBPRINT_CERT_CREDENTIAL</a>.
     * @type {Integer (Int32)}
     */
    static WS_THUMBPRINT_CERT_CREDENTIAL_TYPE => 2

    /**
     * Type id for the certificate credential <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_cert_credential">WS_CUSTOM_CERT_CREDENTIAL</a>.
     * @type {Integer (Int32)}
     */
    static WS_CUSTOM_CERT_CREDENTIAL_TYPE => 3
}
