#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the Async Model to specify the asynchronous callback and a pointer which will be passed to the asynchronous callback.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_async_context
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ASYNC_CONTEXT {
    #StructPack 8

    /**
     * The callback function to call if the operation completes asynchronously.
     *                     This field may not be <b>NULL</b>.
     */
    callback : IntPtr

    /**
     * A pointer to user-defined data which will passed to the asynchronous callback
     *                     function if the operation completes asynchronously.
     */
    callbackState : IntPtr

}
