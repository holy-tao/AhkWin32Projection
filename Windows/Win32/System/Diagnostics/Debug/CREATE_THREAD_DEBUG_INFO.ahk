#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains thread-creation information that can be used by a debugger.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-create_thread_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class CREATE_THREAD_DEBUG_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A handle to the thread whose creation caused the debugging event. If this member is <b>NULL</b>, the handle is not valid. Otherwise, the debugger has THREAD_GET_CONTEXT, THREAD_SET_CONTEXT, and THREAD_SUSPEND_RESUME access to the thread, allowing the debugger to read from and write to the registers of the thread and control execution of the thread.
     * @type {Pointer<HANDLE>}
     */
    hThread {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a block of data. At offset 0x2C into this block is another pointer, called ThreadLocalStoragePointer, that points to an array of per-module thread local storage blocks. This gives a debugger access to per-thread data in the threads of the process being debugged using the same algorithms that a compiler would use.
     * @type {Pointer<Void>}
     */
    lpThreadLocalBase {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the starting address of the thread. This value may only be an approximation of the thread's starting address, because any application with appropriate access to the thread can change the thread's context by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadcontext">SetThreadContext</a> function.
     * @type {Pointer<LPTHREAD_START_ROUTINE>}
     */
    lpStartAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
