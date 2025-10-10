#Requires AutoHotkey v2.0.0 64-bit

/**
 * The types of security keys.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_security_key_handle_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_KEY_HANDLE_TYPE{

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_raw_symmetric_security_key_handle">WS_RAW_SYMMETRIC_SECURITY_KEY_HANDLE</a>.
     * @type {Integer (Int32)}
     */
    static WS_RAW_SYMMETRIC_SECURITY_KEY_HANDLE_TYPE => 1

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_ncrypt_asymmetric_security_key_handle">WS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE</a>.
     * @type {Integer (Int32)}
     */
    static WS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE_TYPE => 2

    /**
     * Type ID for <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_capi_asymmetric_security_key_handle">WS_CAPI_ASYMMETRIC_SECURITY_KEY_HANDLE</a>.
     * @type {Integer (Int32)}
     */
    static WS_CAPI_ASYMMETRIC_SECURITY_KEY_HANDLE_TYPE => 3
}
