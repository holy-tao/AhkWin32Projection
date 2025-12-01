#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The APC_CALLBACK_DATA structure (processthreadsapi.h) specifies the data for a user-mode asynchronous procedure call (APC) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-apc_callback_data
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class APC_CALLBACK_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The data passed to the function using the dwData parameter of the [QueueUserAPC](nf-processthreadsapi-queueuserapc.md) function.
     * @type {Pointer}
     */
    Parameter {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The processor context that was interrupted when the thread was directed to call the APC function.
     * @type {Pointer<CONTEXT>}
     */
    ContextRecord {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reserved for future use; must be zero.
     * @type {Pointer}
     */
    Reserved0 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reserved for future use; must be zero.
     * @type {Pointer}
     */
    Reserved1 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
