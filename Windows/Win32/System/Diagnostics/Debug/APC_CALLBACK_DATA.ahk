#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CONTEXT.ahk" { CONTEXT }

/**
 * The APC_CALLBACK_DATA structure (processthreadsapi.h) specifies the data for a user-mode asynchronous procedure call (APC) object.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-apc_callback_data
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct APC_CALLBACK_DATA {
    #StructPack 8

    /**
     * The data passed to the function using the dwData parameter of the [QueueUserAPC](nf-processthreadsapi-queueuserapc.md) function.
     */
    Parameter : IntPtr

    /**
     * The processor context that was interrupted when the thread was directed to call the APC function.
     */
    ContextRecord : CONTEXT.Ptr

    /**
     * Reserved for future use; must be zero.
     */
    Reserved0 : IntPtr

    /**
     * Reserved for future use; must be zero.
     */
    Reserved1 : IntPtr

}
