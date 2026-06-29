#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the callback function and state for an application that wishes to associate or inspect headers in an input or an output message respectively.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_proxy_message_callback_context
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_PROXY_MESSAGE_CALLBACK_CONTEXT {
    #StructPack 8

    /**
     * application specific callback for handling the message.
     */
    callback : IntPtr

    /**
     * Application specific state that would be made available to the callback upon its invocation.
     */
    state : IntPtr

}
