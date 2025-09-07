#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the Async Model to specify the asynchronous callback and a pointer which will be passed to the asynchronous callback.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_async_context
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ASYNC_CONTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The callback function to call if the operation completes asynchronously.
     *                     This field may not be <b>NULL</b>.
     * @type {Pointer<Ptr>}
     */
    callback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to user-defined data which will passed to the asynchronous callback
     *                     function if the operation completes asynchronously.
     * @type {Pointer<Void>}
     */
    callbackState {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
