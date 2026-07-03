#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WS_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT structure contains the callback function and state for validating the certificate for an HTTP connection.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_certificate_validation_callback_context
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_certificate_validation_callback">WS_CERTIFICATE_VALIDATION_CALLBACK</a> callback that is an application specific callback for validating HTTP certificates.
     */
    callback : IntPtr

    /**
     * Application specific state that is made available to the callback when invoked.
     */
    state : IntPtr

}
