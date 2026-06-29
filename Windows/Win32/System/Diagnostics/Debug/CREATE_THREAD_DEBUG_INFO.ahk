#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Contains thread-creation information that can be used by a debugger.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-create_thread_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct CREATE_THREAD_DEBUG_INFO {
    #StructPack 8

    /**
     * A handle to the thread whose creation caused the debugging event. If this member is <b>NULL</b>, the handle is not valid. Otherwise, the debugger has THREAD_GET_CONTEXT, THREAD_SET_CONTEXT, and THREAD_SUSPEND_RESUME access to the thread, allowing the debugger to read from and write to the registers of the thread and control execution of the thread.
     */
    hThread : HANDLE

    /**
     * A pointer to a block of data. At offset 0x2C into this block is another pointer, called ThreadLocalStoragePointer, that points to an array of per-module thread local storage blocks. This gives a debugger access to per-thread data in the threads of the process being debugged using the same algorithms that a compiler would use.
     */
    lpThreadLocalBase : IntPtr

    /**
     * A pointer to the starting address of the thread. This value may only be an approximation of the thread's starting address, because any application with appropriate access to the thread can change the thread's context by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadcontext">SetThreadContext</a> function.
     */
    lpStartAddress : IntPtr

}
