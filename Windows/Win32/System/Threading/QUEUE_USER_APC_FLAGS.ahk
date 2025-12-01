#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The QUEUE_USER_APC_FLAGS enumeration (processthreadsapi.h) specifies the modifier flags for user-mode asynchronous procedure call (APC) objects.
 * @remarks
 * The *Parameter* argument of the [PAPCFUNC callback function](../winnt/nc-winnt-papcfunc.md) is modified to point to an APC_CALLBACK_DATA structure (see below), which contains the original *Parameter* argument, a pointer to the interrupted processor context, and reserved fields.
 * 
 * ```cpp
 * typedef struct _APC_CALLBACK_DATA {
 *     ULONG_PTR Parameter;
 *     PCONTEXT ContextRecord;
 *     ULONG_PTR Reserved0;
 *     ULONG_PTR Reserved1;
 * } APC_CALLBACK_DATA, *PAPC_CALLBACK_DATA;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-queue_user_apc_flags
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class QUEUE_USER_APC_FLAGS extends Win32Enum{

    /**
     * No flags are passed. Behavior is identical to [QueueUserAPC function](nf-processthreadsapi-queueuserapc.md).
     * @type {Integer (Int32)}
     */
    static QUEUE_USER_APC_FLAGS_NONE => 0

    /**
     * Queue a special user-mode APC instead of a regular user-mode APC.
     * @type {Integer (Int32)}
     */
    static QUEUE_USER_APC_FLAGS_SPECIAL_USER_APC => 1

    /**
     * Receive the processor context that was interrupted when the thread was directed to call the APC function.
     * @type {Integer (Int32)}
     */
    static QUEUE_USER_APC_CALLBACK_DATA_CONTEXT => 65536
}
