#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ASYNC_FUNCTION.ahk" { WS_ASYNC_FUNCTION }

/**
 * Used with the WsAsyncExecute to specify the next function to invoke in a series of async operations. (WS_ASYNC_OPERATION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_async_operation
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ASYNC_OPERATION {
    #StructPack 8

    /**
     * The asynchronous function to invoke.
     */
    function : WS_ASYNC_FUNCTION

}
