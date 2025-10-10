#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains process creation information that can be used by a debugger.
 * @see https://docs.microsoft.com/windows/win32/api//minwinbase/ns-minwinbase-create_process_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class CREATE_PROCESS_DEBUG_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A handle to the process's image file. If this member is <b>NULL</b>, the handle is not 
     *        valid. Otherwise, the debugger can use the member to read from and write to the image file.
     * 
     * When the debugger is finished with this file, it should close the handle using the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @type {Pointer<Void>}
     */
    hFile {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A handle to the process. If this member is <b>NULL</b>, the handle is not valid. 
     *       Otherwise, the debugger can use the member to read from and write to the process's memory.
     * @type {Pointer<Void>}
     */
    hProcess {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A handle to the initial thread of the process identified by the <b>hProcess</b> member. 
     *       If <b>hThread</b> param is <b>NULL</b>, the handle is not valid. 
     *       Otherwise, the debugger has <b>THREAD_GET_CONTEXT</b>, 
     *       <b>THREAD_SET_CONTEXT</b>, and <b>THREAD_SUSPEND_RESUME</b> access to the 
     *       thread, allowing the debugger to read from and write to the registers of the thread and to control execution of 
     *       the thread.
     * @type {Pointer<Void>}
     */
    hThread {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The base address of the executable image that the process is running.
     * @type {Pointer<Void>}
     */
    lpBaseOfImage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The offset to the debugging information in the file identified by the <b>hFile</b> 
     *       member.
     * @type {Integer}
     */
    dwDebugInfoFileOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The size of the debugging information in the file, in bytes. If this value is zero, there is no debugging 
     *       information.
     * @type {Integer}
     */
    nDebugInfoSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A pointer to a block of data. At offset 0x2C into this block is another pointer, called 
     *       <c>ThreadLocalStoragePointer</c>, that points to an array of per-module thread local storage 
     *       blocks. This gives a debugger access to per-thread data in the threads of the process being debugged using the 
     *       same algorithms that a compiler would use.
     * @type {Pointer<Void>}
     */
    lpThreadLocalBase {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the starting address of the thread. This value may only be an approximation of the thread's 
     *       starting address, because any application with appropriate access to the thread can change the thread's context 
     *       by using the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadcontext">SetThreadContext</a> function.
     * @type {Pointer<LPTHREAD_START_ROUTINE>}
     */
    lpStartAddress {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to the file name associated with the <b>hFile</b> member. This parameter may be 
     *        <b>NULL</b>, or it may contain the address of a string pointer in the address space of the 
     *        process being debugged. That address may, in turn, either be <b>NULL</b> or point to the 
     *        actual filename. If <b>fUnicode</b> is a nonzero value, the name string is Unicode; 
     *        otherwise, it is ANSI.
     * 
     * This member is strictly optional. Debuggers must be prepared to handle the case where 
     *        <b>lpImageName</b> is <b>NULL</b> or 
     *        *<b>lpImageName</b> (in the address space of the process being debugged) is 
     *        <b>NULL</b>. Specifically, the system does not provide an image name for a create process 
     *        event, and will not likely pass an image name for the first DLL event. The system also does not provide this 
     *        information in the case of debug events that originate from a call to the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-debugactiveprocess">DebugActiveProcess</a> function.
     * @type {Pointer<Void>}
     */
    lpImageName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A value that indicates whether a file name specified by the <b>lpImageName</b> member 
     *       is Unicode or ANSI. A nonzero value indicates Unicode; zero indicates ANSI.
     * @type {Integer}
     */
    fUnicode {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }
}
