#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A container for callback function pointers that handle logging and error messages.
 * @remarks
 * This is the structure that holds all callback function pointers. Fill in the ones 
 * you want to receive. All callbacks are CIM extensions for tracking
 * logging and error messages.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_sessioncallbacks
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_SessionCallbacks {
    #StructPack 8

    /**
     * A client-specific context that is passed to all of the callbacks. This is used to correlate the callback to the associated operation.
     */
    callbackContext : IntPtr

    /**
     * The CIM extension callback for receiving logging from the session creation. All parameters are valid only for the lifetime of the callback.
     */
    writeMessage : IntPtr

    /**
     * The CIM extension callback for errors. The session version of this function is informative only. The session will fail to create and will  return an error. All parameters are valid only for the lifetime of the callback.
     */
    writeError : IntPtr

}
