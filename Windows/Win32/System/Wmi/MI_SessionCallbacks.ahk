#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A container for callback function pointers that handle logging and error messages.
 * @remarks
 * 
 * This is the structure that holds all callback function pointers. Fill in the ones 
 * you want to receive. All callbacks are CIM extensions for tracking
 * logging and error messages.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_sessioncallbacks
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_SessionCallbacks extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A client-specific context that is passed to all of the callbacks. This is used to correlate the callback to the associated operation.
     * @type {Pointer<Void>}
     */
    callbackContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The CIM extension callback for receiving logging from the session creation. All parameters are valid only for the lifetime of the callback.
     * @type {Pointer}
     */
    writeMessage {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The CIM extension callback for errors. The session version of this function is informative only. The session will fail to create and will  return an error. All parameters are valid only for the lifetime of the callback.
     * @type {Pointer}
     */
    writeError {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
