#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by WsAsyncExecute to manage the state of an asynchronous operation.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_async_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ASYNC_STATE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * This field is internal and should not be modified.
     * @type {Pointer<Void>}
     */
    internal0 {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * This field is internal and should not be modified.
     * @type {Pointer<Void>}
     */
    internal1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This field is internal and should not be modified.
     * @type {Pointer<Void>}
     */
    internal2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * This field is internal and should not be modified.
     * @type {Pointer<Void>}
     */
    internal3 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * This field is internal and should not be modified.
     * @type {Pointer<Void>}
     */
    internal4 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
