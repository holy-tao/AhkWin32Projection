#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the callback function and state for controlling the HTTP auto redirection behavior.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_redirect_callback_context
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTP_REDIRECT_CALLBACK_CONTEXT {
    #StructPack 8

    /**
     * Application specific callback for controlling HTTP auto redirections.
     */
    callback : IntPtr

    /**
     * Application specific state that would be made available to the callback upon its invocation.
     */
    state : IntPtr

}
