#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by WsAsyncExecute to manage the state of an asynchronous operation.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_async_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ASYNC_STATE {
    #StructPack 8

    /**
     * This field is internal and should not be modified.
     */
    internal0 : IntPtr

    /**
     * This field is internal and should not be modified.
     */
    internal1 : IntPtr

    /**
     * This field is internal and should not be modified.
     */
    internal2 : IntPtr

    /**
     * This field is internal and should not be modified.
     */
    internal3 : IntPtr

    /**
     * This field is internal and should not be modified.
     */
    internal4 : IntPtr

}
