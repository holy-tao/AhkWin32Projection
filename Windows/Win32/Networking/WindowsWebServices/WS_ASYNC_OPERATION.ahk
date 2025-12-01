#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the WsAsyncExecute to specify the next function to invoke in a series of async operations. (WS_ASYNC_OPERATION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_async_operation
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ASYNC_OPERATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The asynchronous function to invoke.
     * @type {Pointer<WS_ASYNC_FUNCTION>}
     */
    function {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
