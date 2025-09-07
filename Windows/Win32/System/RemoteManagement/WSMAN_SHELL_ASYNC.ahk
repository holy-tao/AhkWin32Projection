#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an asynchronous structure to be passed to all shell operations.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_shell_async
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_SHELL_ASYNC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the optional user context associated with the operation.
     * @type {Pointer<Void>}
     */
    operationContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_shell_completion_function">WSMAN_SHELL_COMPLETION_FUNCTION</a> callback function for the operation.
     * @type {Pointer<Ptr>}
     */
    completionFunction {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
